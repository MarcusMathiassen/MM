
#include "MM.h"

int main()
{
  MM_App app;
  app.width = 512;
  app.height = 512;
  app.title = "App";
  app.glVersion = 4.1f;

  MM_initApp(app);



  GLuint shaderProgram  = glCreateProgram();
  GLuint vertexShader   = MM_createShader("./res/basic.vs", GL_VERTEX_SHADER);
  GLuint fragmentShader = MM_createShader("./res/basic.fs", GL_FRAGMENT_SHADER);

  glAttachShader(shaderProgram, vertexShader);
  glAttachShader(shaderProgram, fragmentShader);

  glDeleteShader(vertexShader);
  glDeleteShader(fragmentShader);

  glBindAttribLocation(shaderProgram, 0, "position");

  glLinkProgram(shaderProgram);
  glValidateProgram(shaderProgram);

  GLfloat vertices[] =
  {
    -0.5f, -0.5f,
     0.0f,  0.5f,
     0.5f, -0.5f,
  };

  GLuint VAO, VBO;

  glGenVertexArrays(1, &VAO);
  glGenBuffers(1, &VBO);
  glBindVertexArray(VAO);
  glBindBuffer(GL_ARRAY_BUFFER, VBO);

  glBufferData( GL_ARRAY_BUFFER,
                sizeof(vertices) * sizeof(GLfloat),
                vertices,
                GL_STATIC_DRAW
              );

  glEnableVertexAttribArray(0);
  glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 2 * sizeof(GLfloat), NULL);



  uint16_t hue{0};
  while (app.running())
  {
    if (hue++ > 360) hue = 0;
    glm::vec3 color = MM_HSVtoRGB(hue, 1.0f, 1.0f);
    glClearColor(color.r,color.g,color.b, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);

    glBindVertexArray(VAO);
    glUseProgram(shaderProgram);
    glDrawArrays(GL_TRIANGLES, 0, 3);
  }

  app.shutdown();
}
