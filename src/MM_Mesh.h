#ifndef _MM_MESH_H_
#define _MM_MESH_H_

#define GLEW_STATIC
#include <GL/glew.h>

#include <cstdint>

struct MMMesh
{
  enum {POSITION, NORMAL, UV, INDEX, NUM_BUFFERS};
  GLuint VAO{0}, VBO[NUM_BUFFERS]{0};
  uint32_t drawCount{0};

  void draw()
  {
    glEnable(GL_DEPTH_TEST);
    //glEnable(GL_CULL_FACE);
    glDisable(GL_BLEND);
    glBindVertexArray(VAO);
  //glDrawElements(type, drawCount, GL_UNSIGNED_INT, 0);
    glDrawArrays(GL_TRIANGLES, 0, drawCount);
    glEnable(GL_BLEND);
  }

  MMMesh() = default;
  MMMesh(const char* file)
  {
    std::vector<glm::vec3> vertices;
    std::vector<glm::vec3> normals;
    std::vector<glm::vec2> uvs;
    mmOBJLoader(file, &vertices, &normals, &uvs);

    drawCount = vertices.size();

    glGenVertexArrays(1, &VAO);
    glBindVertexArray(VAO);

    // Generate buffers
    glGenBuffers(NUM_BUFFERS, VBO);

    // POSITION
    glBindBuffer(GL_ARRAY_BUFFER, VBO[POSITION]);
    glBufferData(GL_ARRAY_BUFFER, 3*vertices.size() * sizeof(GLfloat), &vertices[0], GL_STATIC_DRAW);
    glEnableVertexAttribArray(0);
    glVertexAttribPointer(0, 3, GL_FLOAT, GL_FALSE, 0, 0);

    // TEXTCOORD
    glBindBuffer(GL_ARRAY_BUFFER, VBO[UV]);
    glBufferData(GL_ARRAY_BUFFER, 2*uvs.size() * sizeof(GLfloat), &uvs[0], GL_STATIC_DRAW);
    glEnableVertexAttribArray(1);
    glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, 0, 0);

    // NORMAL
    glBindBuffer(GL_ARRAY_BUFFER, VBO[NORMAL]);
    glBufferData(GL_ARRAY_BUFFER, 3*normals.size() * sizeof(GLfloat), &normals[0], GL_STATIC_DRAW);
    glEnableVertexAttribArray(2);
    glVertexAttribPointer(2, 3, GL_FLOAT, GL_FALSE, 0, 0);

    // INDEX
    // glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, VBO[INDEX]);
    // glBufferData(GL_ELEMENT_ARRAY_BUFFER, indices.size() * sizeof(indices[0]), &indices[0], GL_STATIC_DRAW);
  }
  ~MMMesh()
  {
    //glDeleteBuffers(NUM_BUFFERS, VBO);
    //glDeleteVertexArrays(1, &VAO);
  }
};

#endif
