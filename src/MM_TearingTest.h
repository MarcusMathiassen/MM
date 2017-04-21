#ifndef _MM_TEARINGTEST_H_
#define _MM_TEARINGTEST_H_

#include "MM_Shader.h"

#define GLEW_STATIC
#include <GL/glew.h>
#define GLFW_DLL
#include <GLFW/glfw3.h>

struct TearingTest
{
  GLuint shaderProgram;
  GLuint VAO, VBO;
  int hue {0};

  TearingTest()
  {
    shaderProgram  = glCreateProgram();
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
      -0.02f,    -1.0f,
      -0.02f,     1.0f,
       0.02f,     1.0f,
       0.02f,    -1.0f,
    };

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
    glVertexAttribPointer(0, 4, GL_FLOAT, GL_FALSE, 2 * sizeof(GLfloat), NULL);
  }

  void draw()
  {
    if (hue++ > 360) hue = 0;
    glm::vec3 color = MM_HSVtoRGB(hue, 1.0f, 1.0f);
    glClearColor(color.r,color.g,color.b, 1.0f);
    glClear(GL_COLOR_BUFFER_BIT);

    float x = (float)sin(glfwGetTime());

    glBindVertexArray(VAO);
    glUseProgram(shaderProgram);
    glUniform2f(glGetUniformLocation(shaderProgram, "pos"),x,0);
    glDrawArrays(GL_TRIANGLE_FAN, 0, 4);
  }

};

#endif