#version 300 es 
precision highp float;

in vec4 worldNormal;
in vec4 worldPosition;
out vec4 fragmentColor;
//LABTODO: world space inputs

uniform struct{
  //LABTODO: uniform for environment
  samplerCube envMapTexture;
} material;

uniform struct{
  mat4 viewProjMatrix;
  //LABTODO: uniform for computing view direction
  vec3 position;
} camera;

//LABTODO: uniforms for light source data

void main(void) {
  vec3 x = worldPosition.xyz / worldPosition.w;
  vec3 viewDir = normalize(camera.position - x);
  vec3 normal = normalize(worldNormal.xyz);
  fragmentColor = texture(material.envMapTexture, reflect(-viewDir, normal));
}
