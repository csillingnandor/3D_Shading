#version 300 es 
precision highp float;

out vec4 fragmentColor;
in vec4 tex;
in vec4 worldPosition;
in vec4 worldNormal;
in vec4 modelPosition;
//LABTODO: world space inputs

uniform struct{
  //LABTODO: uniform for surface color (diffuse refleciton coeff kd)
  samplerCube envMapTexture;
  sampler2D colorTexture;
} material;

uniform struct{
  mat4 viewProjMatrix;
  //LABTODO: uniform for computing view direction
  vec3 position;
} camera;

//LABTODO: uniforms for light source data

uniform struct {
  vec4 position;
  vec3 powerDensity;
} lights[8];


void main(void) {

  vec3 normal = normalize(worldNormal.xyz);

  float cos = dot(worldNormal, lights[0].position);
  float lightingIntensity = max(0.0f, cos);

  fragmentColor = texture(material.colorTexture, tex.xy) * lightingIntensity;

}
