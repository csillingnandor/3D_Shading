#version 300 es

in vec4 vertexPosition;
in vec3 vertexNormal;
in vec4 vertexTexCoord;

uniform struct{
	mat4 modelMatrix;
    mat4 modelMatrixInverse;
	//LABTODO: uniform for transforming normals
} gameObject;

uniform struct{
	mat4 viewProjMatrix;
	//LABTODO: uniform for computing view direction
    vec3 position;
} camera;

out vec4 tex;
out vec4 modelPosition;
out vec4 worldPosition;
out vec4 worldNormal;
//LABTODO: world space outputs

void main(void) {
  gl_Position = vertexPosition * gameObject.modelMatrix * camera.viewProjMatrix;
  modelPosition = vertexPosition;
  worldPosition = vertexPosition * gameObject.modelMatrix;
  tex = vertexTexCoord;
  worldNormal = gameObject.modelMatrixInverse * vec4(vertexNormal, 0);
}