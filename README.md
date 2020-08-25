# hair-renderer

Hair Renderer with opengl

------------------------------

![gif](twice.gif)

## Introduction

Simple Hair and Face Renderer made with opengl.
It uses USC Hair Salon Data [link](http://www-scf.usc.edu/~liwenhu/SHM/database.html) for hair data, and obj file for 3d face. You can generate your 3d face using one image in this repo [link](https://github.com/givenone/face-recon). The position and orientation of hair are aligned with 3D Face made wit it.

## How to run

```
python face.py [input hair data path] [input face file path]
```
`example`
```
./hairviewer hairstyles/strands00088.data obj/sexy/face
```


#### Opengl을 사용한 간단한 헤어 렌더러

[Github Repo](https://github.com/givenone/hair-renderer) 에서 코드를 확인할 수 있다. Face obj wavefront file도 포함되어 있다.

헤어 데이터는 [USC Hair Salon](http://www-scf.usc.edu/~liwenhu/SHM/database.html) 데이터로 심즈에서 데이터를 얻어 가공한 것이다.


데이터는 약 10000개의 Strand로 이루어져 있으며 각 strand는 약 100개의 Vertex로 이루어져 있다. 충분히 Dense하기 때문에 gl의 Line Rendering으로도 충분히 자연스러운 렌더링이 가능하다. Hair를 자연스럽게 렌더링 하려면 Shader가 매우 중요하다. 머리카락은 빛과 아주 특이하게 상호작용한다. 기본적인 Diffuse Reflection과 Specular Reflection 작용이 있으며, subsurface scattering, ambient occlusion 등을 고려해줘야 한다. 특히 머리카락은 아주 여러 겹으로 이루어져 있기 때문에 ambient occlusion 등을 고려하는 것은 쉽지 않다.

### CODE

hair data를 눈으로 확인하기 위해 opengl기반 renderer구현

- Hair는 opengl Line으로 생성
- strand마다 아주 약간의 색깔 variation을 설정
- 그 외의 쉐이딩은 없음

- face는 usc의 기본 3d morphable head 모델 사용
- normal을 사용한 아주 간단한 shading 적용

- 마우스 스크롤 혹은 asdw 으로 zoom과 이동 가능, 정면 결과 `result.png`로 저장

실행 방법 (makefile을 만들다가 include가 잘 안돼서 스크립트로 컴파일 함)


g++ (7 이상), gl, glm, glfw, glew, opencv(이미지 저장용), 등이 설치되어있어야 함. 리눅스 환경에서만 테스트 해봤음.

### Siggraph 2004에 발표된 내용을 참고(Practical Real-Time Hair Rendering and Shading Thorsten Scheuermann* ATI Research, Inc)

Diffuse + Specular + Ambient Occlusion 으로 이루어짐. Alpha blending도 사용. 특히 specular와 base texture에서 random 노이즈를 사용한다는 점이 인상적.

***위 논문 내용 적용 완료***