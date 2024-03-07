# DD-Land

## 프로젝트 개요
DD-Land는 Spring 프레임워크를 활용하여 개발하고 AWS로 배포한 웹 프로젝트입니다.

## 기능 및 구현 목표
1. 회원 기능과 관리자 기능을 분리하여 적절한 태그 및 모달을 활용하여 정보를 제공합니다.
2. 반응형 디자인을 적용하여 모바일 환경에서도 편리하게 이용할 수 있도록 합니다.
3. Spring MVC Model 및 디자인 패턴을 적용하여 프로젝트의 유지보수성 및 확장성을 확보합니다.
4. Socket (채팅) 및 Open API를 활용하여 실시간 통신 기능을 구현합니다.

## 주요 기능
1. DD 월드컵: 어트랙션 월드컵과 코스 월드컵을 진행하여 사용자에게 추천하고, 관리자 페이지를 통해 어트랙션과 코스를 관리합니다.
2. MBTI 추천: 사용자의 MBTI 선택을 통해 어트랙션과 코스를 추천하고, 관리자 페이지를 통해 MBTI를 관리합니다.
3. Spring Security: 로그인 인증 및 인가를 통해 사용자와 관리자를 구분합니다.
4. Socket (채팅): Web socket을 활용하여 실시간으로 채팅을 할 수 있는 기능을 제공합니다.

## 프로젝트 기간
2023년 12월 18일부터 2023년 12월 27일까지 진행되었습니다.

## 프로젝트 구조
- Controller: 웹 요청을 처리하는 컨트롤러 클래스가 위치합니다.
- Domain: DTO(Data Transfer Object) 등 도메인 객체가 위치합니다.
- Mapper: MyBatis의 Mapper 파일이 위치합니다.
- Repository: DAO(Data Access Object) 인터페이스 및 구현체가 위치합니다.
- Service: 비즈니스 로직을 처리하는 서비스 클래스가 위치합니다.
- JSP: 사용자 인터페이스를 담당하는 JSP 파일이 위치합니다.
  
## 웹 애플리케이션 화면
어트랙션 월드컵의 구현부에 대한 설명입니다.
|**메인 페이지**|**설명**|
|:---:|:---:|
|![메인 페이지](https://isaac-seungwon.github.io/portfolio/assets/img/portfolio/portfolio-12/dd-land/dd-land%201.png)|DD-Land에 접속했을 때 메인 페이지입니다.|
|![메인 페이지](https://isaac-seungwon.github.io/portfolio/assets/img/portfolio/portfolio-12/dd-land/dd-land%202.png)|메인 페이지에서 보여주는 추천 어트랙션 3위입니다.|
|**어트랙션 월드컵 페이지**|**설명**|
|![어트랙션 월드컵 페이지](https://isaac-seungwon.github.io/portfolio/assets/img/portfolio/portfolio-12/dd-land/dd-land%204.png)|어트랙션 월드컵 페이지로 이동합니다.|
|![어트랙션 월드컵 페이지](https://isaac-seungwon.github.io/portfolio/assets/img/portfolio/portfolio-12/dd-land/dd-land%206.png)|어트랙션을 선택하여 어트랙션 월드컵을 진행합니다.|
|![어트랙션 월드컵 페이지](https://isaac-seungwon.github.io/portfolio/assets/img/portfolio/portfolio-12/dd-land/dd-land%207.png)|어트랙션 월드컵 결승입니다.|
|![어트랙션 월드컵 페이지](https://isaac-seungwon.github.io/portfolio/assets/img/portfolio/portfolio-12/dd-land/dd-land%208.png)|어트랙션 월드컵에서 최종 우승한 어트랙션입니다.|
|![어트랙션 월드컵 페이지](https://isaac-seungwon.github.io/portfolio/assets/img/portfolio/portfolio-12/dd-land/dd-land%209.png)|최종 우승한 어트랙션을 클릭하면 해당 어트랙션 페이지로 이동합니다.|
|**어트랙션 월드컵 관리자 페이지**|**설명**|
|![어트랙션 월드컵 관리자 페이지](https://isaac-seungwon.github.io/portfolio/assets/img/portfolio/portfolio-12/dd-land/dd-land%2018.png)|어트랙션을 월드컵에 채택할지 여부를 결정하고, 우승 비율 및 승률을 확인합니다.|

