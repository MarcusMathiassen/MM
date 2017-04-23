#ifndef _MM_TRANSFORM_H_
#define _MM_TRANSFORM_H_

#include <glm/glm.hpp>
#include <glm/gtx/transform.hpp>

struct MMTransform
{
  glm::vec3 pos{0, 0, 0};
  glm::vec3 rot{0, 0, 0};
  glm::vec3 scale{1, 1, 1};

  glm::mat4 getModel() const
  {
    const glm::mat4 posMatrix{glm::translate(pos)};
    const glm::mat4 rotXMatrix{glm::rotate(rot.x, glm::vec3{1, 0, 0})};
    const glm::mat4 rotYMatrix{glm::rotate(rot.y, glm::vec3{0, 1, 0})};
    const glm::mat4 rotZMatrix{glm::rotate(rot.z, glm::vec3{0, 0, 1})};
    const glm::mat4 scaleMatrix{glm::scale(scale)};
    const glm::mat4 rotMatrix{rotZMatrix * rotYMatrix * rotXMatrix};
    return posMatrix * rotMatrix * scaleMatrix;
  }

  MMTransform() = default;
};

#endif