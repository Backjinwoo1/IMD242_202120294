//많은 자료들을 찾아보고 코드를 참고해보고자 했으나 완전히 이해하기 어려워 
//만들고자 하는 이미지(거미줄)와 가까워질 때까지 부분적으로 gpt를 활용하여 작업함.(참고 코드 없음)

ArrayList<Circle> circles;  
ArrayList<Line> lines;  

void setup() {
  fullScreen();  
  circles = new ArrayList<Circle>();  // ArrayList 초기화
  lines = new ArrayList<Line>();  // 선을 저장할 ArrayList 초기화
  noStroke();  
  frameRate(60);  
}

void draw() {
  background(0);  
  
  // ArrayList에 있는 모든 Circle 객체들을 화면에 그리기
  for (int i = circles.size() - 1; i >= 0; i--) {
    Circle c = circles.get(i);  // Circle 객체 가져오기
    c.update();  // GPT도움:  Circle 객체의 상태 업데이트 (크기 변화 및 움직임)
    c.display();  // Circle 객체를 화면에 그리기
    
    // GPT도움: 원이 일정 시간이 지나면 제거 
    // -> c,shouldRemove: 원의 크기가 줄어들면서 사라질 시점을 결정하는 역할
    if (c.shouldRemove()) {
      circles.remove(i);  // ArrayList에서 제거
      // GPT도움: 원이 사라졌을 때 그 위치에서 작은 원들을 생성 
      //-> Circle 객체가 사라질 때 그 위치에서 선을 생성하고, 생성된 선들을 lines 리스트에 추가하는 부분
      lines.addAll(c.createLines());  // 작은 원이 사라질 때 선 생성
    }
  }
  
  // 선 그리기
  for (int i = lines.size() - 1; i >= 0; i--) {
    Line l = lines.get(i);  // Line 객체 가져오기
    l.update();  // 선 상태 업데이트 (이동 및 크기 변화)
    l.display();  // 선을 화면에 그리기
    
    // 선이 일정 시간이 지나면 제거
    if (l.shouldRemove()) {
      lines.remove(i);  // ArrayList에서 제거
    }
  }
  
  // 화면 좌측 상단에 ArrayList 크기 표시
  fill(255); 
  textSize(20);
  text("Circles: " + circles.size(), 10, 30);
  text("Lines: " + lines.size(), 10, 60);
}

void mousePressed() {
  // 마우스 클릭 시 새로운 Circle 객체를 추가, 크기는 랜덤으로 설정
  Circle newCircle = new Circle(mouseX, mouseY, random(30, 60)); 
  circles.add(newCircle);  // ArrayList에 추가
}

void mouseDragged() {
  // GPT도움: 마우스를 드래그할 때 새로운 Circle 객체를 추가
  Circle newCircle = new Circle(mouseX, mouseY, random(30, 60));  
  circles.add(newCircle);  // ArrayList에 추가
}

// Circle 클래스 정의 -> 구현할 때 필요한 float와 int의 종류 질문
class Circle {
  float x, y, radius;
  float vx, vy;  // 속도 (벡터)
  color c;
  float creationTime;  // GPT도움: 원이 생성된 시간
  float lifeTime = 3.0;  // GPT도움: 원이 살아있는 시간 (초 단위)
  float shrinkRate = 0.4;  // GPT도움: 원이 줄어드는 비율 (사라지는 속도, 더 빠르게 설정)
  float maxSmallRadius = 60;  // GPT도움: 작은 원들이 퍼지는 최대 반지름
  int splitCount = 0;  // GPT도움: 원이 분열할 때마다 증가하는 카운트 (색상 변경용)

  // Circle 클래스의 생성자
  Circle(float x, float y, float radius) {
    this.x = x;
    this.y = y;
    this.radius = radius;
    this.vx = random(-5, 5);  
    this.vy = random(-5, 5);
    this.creationTime = millis() / 1000.0;  // GPT도움: 생성된 시간을 기록 (초 단위)
  }

  // Circle의 상태를 업데이트하는 메소드
  void update() {
    this.x += vx;  
    this.y += vy;  
    this.c = getColorBasedOnMouse();  // GPT도움: 마우스 위치에 따라 색상 변경되는 방법 질문
    
    // 화면 경계에 부딪히면 튕겨 나가도록 함
    if (x - radius < 0 || x + radius > width) {
      vx *= -1;  // X 방향 속도 반전
    }
    if (y - radius < 0 || y + radius > height) {
      vy *= -1;  // Y 방향 속도 반전
    }
    
    // 원의 크기를 점점 줄여나감
    if (radius > 0) {
      radius -= shrinkRate;  // radius -= shrinkRate; 원의 크기 감소
    }
  }

  // Circle을 화면에 그리는 메소드
  void display() {
    fill(c); 
    ellipse(x, y, radius * 2, radius * 2);  
  }

  // 원이 일정 시간이 지나면 제거할지 결정하는 메소드
  boolean shouldRemove() {
    return radius <= 0;  
  }

  //  GPT도움: 마우스 위치에 따라 색상을 계산하는 메소드
  color getColorBasedOnMouse() {
    float distToMouse = dist(x, y, mouseX, mouseY);  // 원과 마우스 사이의 거리 계산
    float maxDist = 500.0;  // 색상 변화가 적용될 최대 거리
    float lerpValue = map(distToMouse, 0, maxDist, 0, 1);  // 거리에 따라 색상 변경

    // 거리가 가까울수록 주황색, 멀수록 파란색
    color startColor = color(255, 165, 0);  
    color endColor = color(0, 0, 255);  
    return lerpColor(startColor, endColor, lerpValue);  //  GPT도움: 두 색상을 보간하여 반환
  }

  // 원이 화면 밖으로 벗어났는지 체크하는 메소드
  boolean isOffscreen() {
    return x + radius < 0 || x - radius > width || y + radius < 0 || y - radius > height;
  }

  //  GPT도움: 원이 사라졌을 때 선을 생성하는 메소드
  ArrayList<Line> createLines() {
    ArrayList<Line> newLines = new ArrayList<Line>();
    ArrayList<Circle> nearbyCircles = getNearbyCircles();  // 주변 원들 찾아오기

    // 원이 사라질 때 사방으로 선들이 퍼지게 함
    for (int i = 0; i < 8; i++) {
      float angle = random(TWO_PI);  // 랜덤한 방향으로 선을 퍼지게
      newLines.add(new Line(x, y, angle, nearbyCircles));  // 선 생성
    }
    
    return newLines;  //  GPT도움: 생성된 선들 반환
  }

  //  GPT도움: 주변 원들을 찾는 메소드 (반경 100px 이내의 원들)
  ArrayList<Circle> getNearbyCircles() {
    ArrayList<Circle> nearbyCircles = new ArrayList<Circle>();
    for (Circle c : circles) {
      float distance = dist(x, y, c.x, c.y);
      if (distance > 0 && distance < 200) {  //  GPT도움: 자기 자신을 제외하고, 가까운 원들만 포함
        nearbyCircles.add(c);
      }
    }
    return nearbyCircles;
  }
}

// Line 클래스 정의 (선들)
class Line {
  float x, y;  // 선의 시작점
  float angle;  // 선의 방향 (각도)
  float length;  // 선의 길이
  float lifeTime = 1.5;  // 선의 생명 시간 (초 단위, 더 빠르게 사라지도록 설정)
  float creationTime;  // 선이 생성된 시간
  float thickness;  // 선의 두께
  ArrayList<Circle> targetCircles;  // 연결할 원들

  //  GPT도움: Line 클래스의 생성
  Line(float x, float y, float angle, ArrayList<Circle> targetCircles) {
    this.x = x;
    this.y = y;
    this.angle = angle;
    this.length = random(150, 300);  // 선의 길이를 늘림
    this.thickness = random(0.1, 0.5);  // 선의 두께를 아주 얇게 설정 (0.1 ~ 0.5)
    this.targetCircles = targetCircles;  // 주변 원들
    this.creationTime = millis() / 1000.0;  // 생성된 시간을 기록 (초 단위)
  }

  //  GPT도움: Line의 상태를 업데이트하는 메소드
  void update() {
    x += cos(angle) * length * 0.05;  // X 좌표 갱신 (각도에 맞춰 이동)
    y += sin(angle) * length * 0.05;  // Y 좌표 갱신 (각도에 맞춰 이동)
    length *= 0.98;  // 선 길이 감소 (점점 짧아짐)
    thickness *= 0.98;  // 선 두께 감소 (점점 얇아짐)
  }

  // Line을 화면에 그리는 메소드
  void display() {
    stroke(255);  // 선 색상 (흰색)
    strokeWeight(thickness);  // 선의 두께 설정
    line(x, y, x + cos(angle) * length, y + sin(angle) * length);  // 선 그리기

    //  GPT도움: 선과 연결될 주변 원들과 연결되는 선 그리기
    for (Circle c : targetCircles) {
      line(x, y, c.x, c.y);  // 선이 원의 중심점들과 연결되도록
    }
  }

  //  GPT도움: 선이 일정 시간이 지나면 제거할지 결정하는 메소드
  boolean shouldRemove() {
    float currentTime = millis() / 1000.0;  // 현재 시간 (초 단위)
    return currentTime - creationTime > lifeTime || length <= 0 || thickness <= 0;  // 길이나 두께가 0이 되면 제거
  }
}
