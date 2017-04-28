#version 410

const vec2 position[4] = vec2[4](
  vec2(0.0,     0.0625),
  vec2(0.0,     0.0),
  vec2(0.0625,  0.0),
  vec2(0.0625,  0.0625)
);

const vec2 tex[256] = vec2[256](
  vec2(0.000000, 0.000000),
  vec2(0.062500, 0.000000),
  vec2(0.125000, 0.000000),
  vec2(0.187500, 0.000000),
  vec2(0.250000, 0.000000),
  vec2(0.312500, 0.000000),
  vec2(0.375000, 0.000000),
  vec2(0.437500, 0.000000),
  vec2(0.500000, 0.000000),
  vec2(0.562500, 0.000000),
  vec2(0.625000, 0.000000),
  vec2(0.687500, 0.000000),
  vec2(0.750000, 0.000000),
  vec2(0.812500, 0.000000),
  vec2(0.875000, 0.000000),
  vec2(0.937500, 0.000000),
  vec2(0.000000, 0.062500),
  vec2(0.062500, 0.062500),
  vec2(0.125000, 0.062500),
  vec2(0.187500, 0.062500),
  vec2(0.250000, 0.062500),
  vec2(0.312500, 0.062500),
  vec2(0.375000, 0.062500),
  vec2(0.437500, 0.062500),
  vec2(0.500000, 0.062500),
  vec2(0.562500, 0.062500),
  vec2(0.625000, 0.062500),
  vec2(0.687500, 0.062500),
  vec2(0.750000, 0.062500),
  vec2(0.812500, 0.062500),
  vec2(0.875000, 0.062500),
  vec2(0.937500, 0.062500),
  vec2(0.000000, 0.125000),
  vec2(0.062500, 0.125000),
  vec2(0.125000, 0.125000),
  vec2(0.187500, 0.125000),
  vec2(0.250000, 0.125000),
  vec2(0.312500, 0.125000),
  vec2(0.375000, 0.125000),
  vec2(0.437500, 0.125000),
  vec2(0.500000, 0.125000),
  vec2(0.562500, 0.125000),
  vec2(0.625000, 0.125000),
  vec2(0.687500, 0.125000),
  vec2(0.750000, 0.125000),
  vec2(0.812500, 0.125000),
  vec2(0.875000, 0.125000),
  vec2(0.937500, 0.125000),
  vec2(0.000000, 0.187500),
  vec2(0.062500, 0.187500),
  vec2(0.125000, 0.187500),
  vec2(0.187500, 0.187500),
  vec2(0.250000, 0.187500),
  vec2(0.312500, 0.187500),
  vec2(0.375000, 0.187500),
  vec2(0.437500, 0.187500),
  vec2(0.500000, 0.187500),
  vec2(0.562500, 0.187500),
  vec2(0.625000, 0.187500),
  vec2(0.687500, 0.187500),
  vec2(0.750000, 0.187500),
  vec2(0.812500, 0.187500),
  vec2(0.875000, 0.187500),
  vec2(0.937500, 0.187500),
  vec2(0.000000, 0.250000),
  vec2(0.062500, 0.250000),
  vec2(0.125000, 0.250000),
  vec2(0.187500, 0.250000),
  vec2(0.250000, 0.250000),
  vec2(0.312500, 0.250000),
  vec2(0.375000, 0.250000),
  vec2(0.437500, 0.250000),
  vec2(0.500000, 0.250000),
  vec2(0.562500, 0.250000),
  vec2(0.625000, 0.250000),
  vec2(0.687500, 0.250000),
  vec2(0.750000, 0.250000),
  vec2(0.812500, 0.250000),
  vec2(0.875000, 0.250000),
  vec2(0.937500, 0.250000),
  vec2(0.000000, 0.312500),
  vec2(0.062500, 0.312500),
  vec2(0.125000, 0.312500),
  vec2(0.187500, 0.312500),
  vec2(0.250000, 0.312500),
  vec2(0.312500, 0.312500),
  vec2(0.375000, 0.312500),
  vec2(0.437500, 0.312500),
  vec2(0.500000, 0.312500),
  vec2(0.562500, 0.312500),
  vec2(0.625000, 0.312500),
  vec2(0.687500, 0.312500),
  vec2(0.750000, 0.312500),
  vec2(0.812500, 0.312500),
  vec2(0.875000, 0.312500),
  vec2(0.937500, 0.312500),
  vec2(0.000000, 0.375000),
  vec2(0.062500, 0.375000),
  vec2(0.125000, 0.375000),
  vec2(0.187500, 0.375000),
  vec2(0.250000, 0.375000),
  vec2(0.312500, 0.375000),
  vec2(0.375000, 0.375000),
  vec2(0.437500, 0.375000),
  vec2(0.500000, 0.375000),
  vec2(0.562500, 0.375000),
  vec2(0.625000, 0.375000),
  vec2(0.687500, 0.375000),
  vec2(0.750000, 0.375000),
  vec2(0.812500, 0.375000),
  vec2(0.875000, 0.375000),
  vec2(0.937500, 0.375000),
  vec2(0.000000, 0.437500),
  vec2(0.062500, 0.437500),
  vec2(0.125000, 0.437500),
  vec2(0.187500, 0.437500),
  vec2(0.250000, 0.437500),
  vec2(0.312500, 0.437500),
  vec2(0.375000, 0.437500),
  vec2(0.437500, 0.437500),
  vec2(0.500000, 0.437500),
  vec2(0.562500, 0.437500),
  vec2(0.625000, 0.437500),
  vec2(0.687500, 0.437500),
  vec2(0.750000, 0.437500),
  vec2(0.812500, 0.437500),
  vec2(0.875000, 0.437500),
  vec2(0.937500, 0.437500),
  vec2(0.000000, 0.500000),
  vec2(0.062500, 0.500000),
  vec2(0.125000, 0.500000),
  vec2(0.187500, 0.500000),
  vec2(0.250000, 0.500000),
  vec2(0.312500, 0.500000),
  vec2(0.375000, 0.500000),
  vec2(0.437500, 0.500000),
  vec2(0.500000, 0.500000),
  vec2(0.562500, 0.500000),
  vec2(0.625000, 0.500000),
  vec2(0.687500, 0.500000),
  vec2(0.750000, 0.500000),
  vec2(0.812500, 0.500000),
  vec2(0.875000, 0.500000),
  vec2(0.937500, 0.500000),
  vec2(0.000000, 0.562500),
  vec2(0.062500, 0.562500),
  vec2(0.125000, 0.562500),
  vec2(0.187500, 0.562500),
  vec2(0.250000, 0.562500),
  vec2(0.312500, 0.562500),
  vec2(0.375000, 0.562500),
  vec2(0.437500, 0.562500),
  vec2(0.500000, 0.562500),
  vec2(0.562500, 0.562500),
  vec2(0.625000, 0.562500),
  vec2(0.687500, 0.562500),
  vec2(0.750000, 0.562500),
  vec2(0.812500, 0.562500),
  vec2(0.875000, 0.562500),
  vec2(0.937500, 0.562500),
  vec2(0.000000, 0.625000),
  vec2(0.062500, 0.625000),
  vec2(0.125000, 0.625000),
  vec2(0.187500, 0.625000),
  vec2(0.250000, 0.625000),
  vec2(0.312500, 0.625000),
  vec2(0.375000, 0.625000),
  vec2(0.437500, 0.625000),
  vec2(0.500000, 0.625000),
  vec2(0.562500, 0.625000),
  vec2(0.625000, 0.625000),
  vec2(0.687500, 0.625000),
  vec2(0.750000, 0.625000),
  vec2(0.812500, 0.625000),
  vec2(0.875000, 0.625000),
  vec2(0.937500, 0.625000),
  vec2(0.000000, 0.687500),
  vec2(0.062500, 0.687500),
  vec2(0.125000, 0.687500),
  vec2(0.187500, 0.687500),
  vec2(0.250000, 0.687500),
  vec2(0.312500, 0.687500),
  vec2(0.375000, 0.687500),
  vec2(0.437500, 0.687500),
  vec2(0.500000, 0.687500),
  vec2(0.562500, 0.687500),
  vec2(0.625000, 0.687500),
  vec2(0.687500, 0.687500),
  vec2(0.750000, 0.687500),
  vec2(0.812500, 0.687500),
  vec2(0.875000, 0.687500),
  vec2(0.937500, 0.687500),
  vec2(0.000000, 0.750000),
  vec2(0.062500, 0.750000),
  vec2(0.125000, 0.750000),
  vec2(0.187500, 0.750000),
  vec2(0.250000, 0.750000),
  vec2(0.312500, 0.750000),
  vec2(0.375000, 0.750000),
  vec2(0.437500, 0.750000),
  vec2(0.500000, 0.750000),
  vec2(0.562500, 0.750000),
  vec2(0.625000, 0.750000),
  vec2(0.687500, 0.750000),
  vec2(0.750000, 0.750000),
  vec2(0.812500, 0.750000),
  vec2(0.875000, 0.750000),
  vec2(0.937500, 0.750000),
  vec2(0.000000, 0.812500),
  vec2(0.062500, 0.812500),
  vec2(0.125000, 0.812500),
  vec2(0.187500, 0.812500),
  vec2(0.250000, 0.812500),
  vec2(0.312500, 0.812500),
  vec2(0.375000, 0.812500),
  vec2(0.437500, 0.812500),
  vec2(0.500000, 0.812500),
  vec2(0.562500, 0.812500),
  vec2(0.625000, 0.812500),
  vec2(0.687500, 0.812500),
  vec2(0.750000, 0.812500),
  vec2(0.812500, 0.812500),
  vec2(0.875000, 0.812500),
  vec2(0.937500, 0.812500),
  vec2(0.000000, 0.875000),
  vec2(0.062500, 0.875000),
  vec2(0.125000, 0.875000),
  vec2(0.187500, 0.875000),
  vec2(0.250000, 0.875000),
  vec2(0.312500, 0.875000),
  vec2(0.375000, 0.875000),
  vec2(0.437500, 0.875000),
  vec2(0.500000, 0.875000),
  vec2(0.562500, 0.875000),
  vec2(0.625000, 0.875000),
  vec2(0.687500, 0.875000),
  vec2(0.750000, 0.875000),
  vec2(0.812500, 0.875000),
  vec2(0.875000, 0.875000),
  vec2(0.937500, 0.875000),
  vec2(0.000000, 0.937500),
  vec2(0.062500, 0.937500),
  vec2(0.125000, 0.937500),
  vec2(0.187500, 0.937500),
  vec2(0.250000, 0.937500),
  vec2(0.312500, 0.937500),
  vec2(0.375000, 0.937500),
  vec2(0.437500, 0.937500),
  vec2(0.500000, 0.937500),
  vec2(0.562500, 0.937500),
  vec2(0.625000, 0.937500),
  vec2(0.687500, 0.937500),
  vec2(0.750000, 0.937500),
  vec2(0.812500, 0.937500),
  vec2(0.875000, 0.937500),
  vec2(0.937500, 0.937500)
);

uniform int textCoord_index;
uniform vec2 pos_offset;
uniform vec4 color;

out Vertex
{
  vec2 textCoord;
  vec4 color;
} vertex;

void main()
{
  vertex.textCoord.x = tex[textCoord_index-32].x + 0.0625*(gl_VertexID/2);
  vertex.textCoord.y = tex[textCoord_index-32].y + 0.0625*((gl_VertexID*gl_VertexID)%3);
  vertex.color       = color;

  gl_Position      = vec4(position[gl_VertexID] + pos_offset, 0.0, 1.0 );
}
