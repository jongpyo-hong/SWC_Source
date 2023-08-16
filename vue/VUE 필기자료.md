<style>
  .codes { display: block; overflow-x: auto; background: #282a36; color: #f8f8f2; padding: 10px; }
</style>

# Vue.js 기초

## 1. Vue 인스턴스

- Vue.js로 프론트엔드 개발할 때 Vue 인스턴스를 생성하여 시작합니다.
- Vue 인스턴스에 제공되는 옵션을 사용해 개발할 수 있습니다.

<div class="codes">
  <code class="codes">
    new Vue({
      el : "#app",
      data: {
        text : 'hello world'
      },
    })
  </code>
</div>

- 주로 위와 같은 방식으로 Vue 인스턴스를 생성하며, el과 data 옵션을 사용하여 화면을 제어합니다.

## 2. 데이터 표시 {{ 데이터 }}

<div class="codes">
  <code class="codes">
    <div id="app">
      <p> {{ myText }}</p>
    </div>
    <script>
      new Vue({
        el: '#app',
        data: {
          myText: 'Hello!!!'
        }
      })
    </script>
  </code>
</div>

- 데이터를 HTML에서 표시할 때는 `{{ myText }}`와 같이 사용합니다.
- 또한 디렉티브인 `v-text`를 사용해 데이터를 표시할 수도 있습니다.

## 3. 데이터 종류

### 데이터 타입

<div class="codes">
  <code class="codes">
    <div id="app">
      <p>{{ myPrice * 1.08 }}</p>
      <p>{{ "안녕하세요~ " + myName + "님" }}</p>
      <p>{{ myName.substr(0, 1) }}</p>
    </div>
    <script>
      new Vue({
        el: '#app',
        data: {
          myPrice: 500,
          myName: '홍길동'
        }
      })
    </script>
  </code>
</div>

- Vue에서 데이터 타입으로 숫자형, 문자형, Boolean을 사용할 수 있습니다.

### 배열, 오브젝트

<div class="codes">
  <code class="codes">
    <h2>배열로 값을 표시하는 예제</h2>
    <div id="app">
      <p>{{ myArray }}</p>
      <p>{{ myArray[0] }}</p>
      <p>{{ myObject.name }}</p>
      <p>{{ myObject.price }}</p>
    </div>
    <script>
      new Vue({
        el: '#app',
        data: {
          myArray: ['다즐링', '얼그레이', '실론'],
          myObject: { name: '다즐링', price: 600 }
        }
      })
    </script>
  </code>
</div>

- 프로퍼티에 배열과 오브젝트를 설정하여 HTML에 출력할 수 있습니다.

## 4. 속성 지정

### v-bind

<div class="codes">
  <code class="codes">
    <div id="app">
      <input :type='type1'>
      <input v-bind:type='type2'>
      <a :href='url'>url</a>
      <p v-bind:class='class1'>v-bind 클래스 지정</p>
      <p v-bind:class='[class1, class2]'>다중 클래스 지정</p>
      <p v-bind:class="{'test-class1': isON}">클래스 ON/OFF</p>
    </div>
    <script>
      new Vue({
        el: '#app',
        data: {
          url: 'https://naver.com',
          type1: 'radio',
          type2: 'text',
          class1: 'test-class1',
          class2: 'test-class2',
          isON: true
        }
      })
    </script>
  </code>
</div>

## 5. 입력 폼 연결

### v-model

<div class="codes">
  <code class="codes">
    <h2>입력한 문자열을 표시하는 예제</h2>
    <div id="app">
      <input v-model="input_model" placeholder="이름">
      <p>input model: {{ input_model }}</p>

      <input v-model.lazy="input_model2">
      <p>input lazy model: {{ input_model2 }}</p>

      <textarea v-model="textarea_model"></textarea>
      <p>textarea model: {{ textarea_model }}</p>

      <input type="checkbox" v-model="checkbox_model" value="awd">
      <button v-bind:disabled="checkbox_model === false">disabledd</button>
      <p>checkbox model: {{ checkbox_model }}</p>

      <input type="checkbox" v-model="checkbox_model2" value="test1">
      <input type="checkbox" v-model="checkbox_model2" value="test2">
      <p>checkbox model: {{ checkbox_model2 }}</p>

      <input type="radio" v-model="radio_model" value="test1">
      <input type="radio" v-model="radio_model" value="test2">
      <input type="radio" v-model="radio_model" value="test3">
      <p>radio model: {{ radio_model }}</p>

      <select v-model="select_model">
        <option>test1</option>
        <option>test2</option>
      </select>
      <p>select model: {{ select_model }}</p>
    </div>
    <script>
      new Vue({
        el: '#app',
        data: {
          input_model: '',
          input_model2: '',
          textarea_model: '',
          checkbox_model: false,
          checkbox_model2: [],
          radio_model: '',
          select_model: ''
        }
      })
    </script>
  </code>
</div>

## 6. 이벤트 연결

### v-on

<div class="codes">
  <code class="codes">
    <div id="app">
      <button v-on:click="countUp">1씩 증가</button>
      <p>{{ count }}</p>

      <button :disabled="click" v-on:click="oneClick">한 번만 클릭 가능</button>
      <p>{{ text }}</p>

      <button v-on:click="paramClick(10)">10씩 증가</button>
      <p>{{ tenCount }}</p>

      <input v-on:keyup.enter="alertClick">
    </div>
    <script>
      new Vue({
        el: '#app',
        data: {
          count: 0,
          click: false,
          text: "",
          tenCount: 0
        },
        methods: {
          countUp() {
            this.count++;
          },
          oneClick() {
            this.click = true;
            this.text = "click";
          },
          paramClick(num) {
            this.tenCount += num;
          },
          alertClick() {
            alert("Enter key pressed");
          }
        }
      })
    </script>
  </code>
</div>

## 7. 조건문/반복문

### v-if, v-else-if, v-else

<div class="codes">
  <code class="codes">
    <div id="app">
      <button v-bind:disabled="one" v-on:click="oneCheck">one</button>
      <button v-bind:disabled="two" v-on:click="twoCheck">two</button>
      <button v-bind:disabled="three" v-on:click="threeCheck">three</button>
      <p v-if="one">One click</p>
      <p v-else-if="two">Two click</p>
      <p v-else>Three click</p>
    </div>
    <script>
      new Vue({
        el: '#app',
        data: {
          one: false,
          two: false,
          three: true
        },
        methods: {
          oneCheck() {
            this.one = true;
            this.two = false;
            this.three = false;
          },
          twoCheck() {
            this.one = false;
            this.two = true;
            this.three = false;
          },
          threeCheck() {
            this.one = false;
            this.two = false;
            this.three = true;
          }
        }
      })
    </script>
  </code>
</div>

### v-for

<div class="codes">
  <code class="codes">
    <div id="app">
      <ul>
        <li v-for="item in arr">{{ item }}</li>
        <li v-for="(value, key) in obj">{{ key }}: {{ value }}</li>
        <li v-for="item in objArr">{{ item.a }}: {{ item.b }}: {{ item.c }}</li>
        <input v-model="num">
        <button v-on:click="add(num)">add</button>
        <button v-on:click="deletes()">delete</button>
        <li v-for="item in pushArr">{{ item }}</li>
      </ul>
    </div>
    <script>
      new Vue({
        el: '#app',
        data: {
          arr: ['쨈빵', '멜론빵', '크로와사'],
          obj: {'a': 1, 'b': 2, 'c': 3},
          objArr: [{'a': 1, 'b': 2, 'c': 3}, {'a': 4, 'b': 5, 'c': 6}],
          pushArr: [],
          num: 0
        },
        methods: {
          add(val) {
            this.pushArr.push(val);
          },
          deletes() {
            this.pushArr.pop();
          }
        }
      })
    </script>
  </code>
</div>

## 8. 데이터 변화 감지

### computed

<div class="codes">
  <code class="codes">
    <div id="app">
      <input v-model.number="price" type="number">원 x
      <input v-model.number="count" type="number">개
      <p>합계 {{ sum }} 원</p>
      <p>세금 포함 {{ taxIncluded }} 원</p>
    </div>
    <script>
      new Vue({
        el: '#app',
        data: {
          price: 100,
          count: 1
        },
        computed: {
          sum: function () {
            return this.price * this.count;
          },
          taxIncluded: function() {
            return this.sum * 1.08;
          }
        }
      })
    </script>
  </code>
</div>

### watch

<div class="codes">
  <code class="codes">
    <div id="app">
      <p>금지 문자는、「{{ forbiddenText }}」</p>
      <textarea v-model="inputText"></textarea>
    </div>
    <script>
      new Vue({
        el: '#app',
        data: {
          forbiddenText: '안되',
          inputText: '오늘은 날씨가 좋습니다.'
        },
        watch: {
          inputText: function(){
            var pos = this.inputText.indexOf(this.forbiddenText);
            if (pos >= 0) {
              alert(this.forbiddenText + "는 입력할 수 없습니다.");
              this.inputText = this.inputText.substr(0, pos);
            }
          }
        }
      })
    </script>
  </code>
</div>

## 9. 컴포넌트

### 전역 컴포넌트

Vue.component('컴포넌트 태그', {template: "HTML 코드"});

- 전역 컴포넌트는 Vue.component를 사용하여 등록합니다.
- 이렇게 등록하면 어디에서든 사용할 수 있지만 성능 문제가 있을 수 있습니다.

### 지역 컴포넌트

<code class="codes">
  <div id="app">
    <my-component></my-component>
    <my-component></my-component>
    <my-component></my-component>
  </div>
  <script>
    var MyComponent = {
      template: '<p class="my-comp">Hello</p>'
    }
    new Vue({
      el: '#app',
      components: {
        'my-component': MyComponent
      }
    })
  </script>
  <style>
    .my-comp {
      width: 300px;
      background-color: #f123;
      border: solid;
      border-color: darkorange;
      border-radius: 8px;
      padding: 10px;
      color: #fff;
      text-align: center;
    }
  </style>
</code>

- 지역 컴포넌트는 Vue 인스턴스의 components 속성을 사용하여 등록합니다.
- 등록한 후에는 해당 컴포넌트를 HTML에서 태그로 사용할 수 있습니다.

## 10. 라우팅

Vue Router를 사용하여 SPA에서 페이지 간 이동을 처리할 수 있습니다. 먼저 Vue Router를 설치하고 사용하는 방법에 대해 알아보겠습니다.

### Vue Router 설치

```bash
npm install vue-router
