<style>
  .codes { display: block; overflow-x: auto; background: #282a36; color: #f8f8f2; }
</style>
# VUE

--------------------------------------------------------------------------------------------------

## 1. Vue 인스턴스

- vue.js로 프론트엔드를 개발할때는 Vue 인스턴스를 만드는 것부터 시작한다.
- vue 인스턴스에서 제공되는 옵션을 붙여 개발을 할 수 있다.

      <code class="codes">
        new Vue({
          el : "#app",
          data: {
            text : 'hello world'
          },
        })
      </code>

- 기본적으로 위의 코드처럼 new Vue를 통해 인스턴스를 생성하고 안에 el, data등 옵션을 넣어 인스턴스를 생성하고 화면을 컨트롤 할 수 있다.

--------------------------------------------------------------------------------------------------


## 2. 데이터 표시 {{ 데이터 }}

  - <code class="codes">
        <div id="app">
          <p> {{ myText }}</p>  <!-- myText의 값 출력 -->
        </div>
        <script>
          new Vue({
            el: '#app',          //id="app"
            data: {              
              myText:'Hello!!!'  //myText라는 프로퍼티
            }
          })
        </script>
  <code>

### v-text

- 위와 같이 프로퍼티를 html에 표현할 때는 {{ 프로퍼티 이름 }} 형식으로 표현한다.
- 이것을 디렉티브라는것을 통해서도 표현이 가능한데, 디렉티브는 Vue에서 HTML 요소에 대해 실행하는 명령어다.
- 디렉티브는 'v-'가 붙어있는데, 위의 코드는 아래의 HTML로 표현이 가능하다.

    - < div id="app" >
        < p v-text="myText"></ p >    <!-- v-text라는 디렉티브를 통해 myText 프로퍼티 표현-->
      < /div >


### v-html

- v-text는 프로퍼티 텍스트를 그대로 출력하지만 v-html은 HTML로 표현이 된다.

   ``` 
  <code class="codes">
      <h2>HTML로 표시하는 예제</h2>
      <div id="app">
          <p>{{ myText }}</p>
          <p v-text="myText"></p>
          <p v-html="myText"></p>
      </div>
      <script>
        new Vue({
            el: '#app',
            data: {
                myText:'<h1>Hello!!!</h1>
            }
        })
    </script>
  </code>```

--------------------------------------------------------------------------------------------------

## 3. 데이터 종류

### 데이터 타입

- Vue에서 데이터타입은 숫자형, 문자형, Boolean이 있다.

<code class="codes">

    <div id="app">
      <p>{{ myPrice * 1.08 }}</p>
      <p>{{ "안녕하세요~ "+ myName + "님" }}</p>
      <p>{{ myName.substr(0,1) }}</p>
    </div>
    <script>
      new Vue({
        el: '#app',
        data: {
          myPrice:500,       //숫자형
          myName:'홍길동'    //문자형
        }
      })
    </script>

</code>

- 위의 코드처럼 숫자형, 문자형에 맞게 수식이나 문자함수를 이용할 수 있다.


### 배열, 오브젝트

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
              myArray:['다즐링','얼그레이','실론'],
              myObject:{name:'다즐링', price:600}
            }
          })
        </script>

</code>
- 프로퍼티에 배열, 오브젝트를 설정해 HTML에 출력할 수 있다.

--------------------------------------------------------------------------------------------------

## 4. 속성지정

### v-bind

- v-bind는 태그의 속성을 vue에서 지정할 수 있는 디렉테브다.

<code class="codes">

          <div id="app">
            <input :type='type1'>        <!-- v-bind 생략 가능 -->
            <input v-bind:type='type2'>
            <a :href='url'>url</a>
            <p v-bind:class='class1'>v-bind 클래스지정</p>
            <p v-bind:class='[class1, class2]'>다중 클래스 지정</p>
            <p v-bind:class="{'test-class1': isON}">클래스 ON/OFF</p>  <!-- isON의 값이 true/false-->
          </div>
          <script>
            new Vue({
              el: '#app',
              data: {
                url:'https://naver.com',
                type1:'radio',
                type2:'text'
                class1:'test-class1',
                class2:'test-class2',
                isON: true
              }
            })
          </script>

</code>


--------------------------------------------------------------------------------------------------

## 5. 입력 폼 연결

### v-bind

- v-bind를 통해 input에서 입력한 값을 프로퍼티에 저장 가능하다. 다양한 예제를 아래와 같이 다 입력해놨다.

<code class="codes">

    <h2>입력한 문자열을 표시하는 예제</h2>
    <div id="app">
    <!--v-model을 사용해 프로퍼티에 값을 input값으로 저장가능-->
    <input v-model="input_model" placeholder="이름">
    <p>input model : {{input_model}}</p>

    <!--lazy는 input의 포커스를 다른곳으로 이동할 때 프로퍼티에 저장하는 기능-->
    <input v-model.lazy="input_model2">
    <p>input lazy model : {{input_model2}}</p>

    <!--textarea에서도 v-model 사용가능-->
    <textarea v-model="textarea_model"></textarea>
    <p>textarea model : {{textarea_model}}</p>

    <!--checkbox에서 사용 예제 저장된 프로퍼티를 v-bind를 통해 로직 실행가능-->
    <input type="checkbox" v-model="checkbox_model" value="awd">
    <button v-bind:disabled="checkbox_model === false">disabledd</button>
    <p>checkbox model : {{checkbox_model}}</p>

    <!--프로퍼티를 배열로 선언하면 value값을 저장-->
    <input type="checkbox" v-model="checkbox_model2" value="test1">
    <input type="checkbox" v-model="checkbox_model2" value="test2">
    <p>checkbox model : {{checkbox_model2}}</p>

    <!--라디오 프로퍼티 저장-->
    <input type="radio" v-model="radio_model" value="test1">
    <input type="radio" v-model="radio_model" value="test2">
    <input type="radio" v-model="radio_model" value="test3">
    <p>radio model : {{radio_model}}</p>

    <!--select 프로퍼티 저장-->
    <select v-model="select_model">
      <option>test1</option>
      <option>test2</option>
    </select>
    <p>select model : {{select_model}}</p>
    </div>

    <script>
      new Vue({
        el: '#app',
        data: {
          input_model:'',
          input_model2:'',
          textarea_model:'',
          checkbox_model:false,
          checkbox_model2:[],
          radio_model:'',
          select_model:''
        }
      })
    </script>

</code>

--------------------------------------------------------------------------------------------------

## 6. 이벤트 연결

### v-on

- v-on 디렉티브를 사용해 이벤트 메서드와 연결할 수 있다.


<code class="codes">

    <div id="app">
      <!--v-on:click으로 클릭이벤트 설정 가능-->
      <button v-on:click="countUp">1씩증가</button>
      <p>{{ count }}</p>

      <button :disabled="click" v-on:click="oneClick">한번만 클릭 가능</button>
      <p>{{ text }}</p>

      <!--함수 param전달-->
      <button v-on:click="paramClick(10)">10씩증가</button>
      <p>{{ tenCount }}</p>

      <!--특정 키를 누를 때 함수 실행(포커스 상태에서)-->
      <input v-on:keyup.enter="alertClick">
    </div>
    <script>
      new Vue({
        el: '#app',
        data: {
          count:0,
          click:false,
          text:"",
          tenCount:0
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
            this.tenCount += 10;
          },
          alertClick() {
            alert("enter");
          }
        }
      })
    </script>

</code>


--------------------------------------------------------------------------------------------------

## 7. 조건문/반복문

### v-f, v-else-if, v-else

- v-if를 사용해서 프로퍼티를 이용해 조건을 주어 HTML을 표현할 수 있다.


<code class="codes">

    <div id="app">
      <!--버튼 클릭시 클릭한 text출력과 클릭한 버튼 비활성-->
      <button v-bind:disabled="one" v-on:click="oneCheck">one</button>
      <button v-bind:disabled="two" v-on:click="twoCheck">two</button>
      <button v-bind:disabled="three" v-on:click="threeCheck">three</button>
      <p v-if="one">onc click</p>
      <p v-else-if="two">two click</p>
      <p v-else>three click</p>
    </div>

    <script>
      new Vue({
        el: '#app',
        data: {
          one: false,
          two: false,
          three: true,
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


### v-for

- v-for은 배열로 이루어진 프로퍼티를 반복적으로 표현할 때 사용한다.


<code class="codes">

    <div id="app">
      <ul>
        <!--arr배열의 각 요소를 item에 담는다-->
        <li v-for="item in arr">{{ item }}</li><br>

        <!--object의 key값과 value를 불러와 출력가능-->
        <li v-for="(value, key) in obj">{{ key }} : {{ value }}</li><br>

        <!--objectArray의 item(Object)를 출력-->
        <li v-for="(item) in objArr">{{ item.a}} : {{ item.b }} : {{ item.c }}</li><br>

        <!--입력값을 추가 하는 기능-->
        <input v-model="num">
        <button v-on:click="add(num)">add</button>
        <button v-on:click="deletes()">delete</button>
        <li v-for="item in pushArr">{{item}}</li>
      </ul>
    </div>

    <script>
      new Vue({
        el: '#app',
        data: {
          arr: ['쨈빵','멜론빵','크로와사'],
          obj: {'a':1, 'b':2, 'c':3},
          objArr: [{'a':1, 'b':2, 'c':3}, {'a':4, 'b':5, 'c':6}],
          pushArr: [],
          num:0
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

--------------------------------------------------------------------------------------------------


## 8. 데이터 변화 감지

### computed

- 어떤 값을 출력할 때 따로 연산을 추가해서 넣고 싶을때, computed라는 속성을 프로퍼티에 정의하여 사용할 수 있다.

- 아래의 코드를 보면 price와 count값을 변경 시킬때마다 computed의 sum 함수가 실행되고, taxInclude 함수가 실행되어 세금포함에 taxIncluded를 출력한다.

- computed의 원리가 각 함수안에 들어있는 값의 변경을 감지하여 실행되게 되는데, 예제코드는 price또는 count값이 변경되면 sum함수안의 프로퍼티가 변경되는것 이므로, sum이 실행, 변경되면
taxIncluded안의 프로퍼티가 변경되어 실행되게 된다.


<code class="codes">

    <div id="app">
      <input v-model.number="price" type="number">원 x
      <input v-model.number="count" type="number">개
      <p>　　　합계 {{ sum }} 원</p>
      <p>세금포함 {{ taxIncluded }} 원</p>
    </div>
    <script>
      new Vue({
        el: '#app',
        data: {
          price: 100,
          count: 1
        },
        <!--computed의 함수들은 항상 값을 반환해야하고, 함수 내부의 프로퍼티가 변경되면 실행된다.-->
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


### watch

- watch도 기본적으로는 computed처럼 값이 변경되면 실행되는것은 같다.

- 하지만 computed는 무조건 반환값이 있어야하는데, watch는 그렇지않다. 그래서 보통 computed는 계산식을 적용, watch는 어떤 로직에 따른 처리를 할 때 사용한다.


<code class="codes">

    <div id="app">
      <p>금지문자는、「{{ forbiddenText }}」</p>
      <textarea  v-model="inputText"></textarea>
    </div>

    <script>
      new Vue({
        el: '#app',
        data: {
          forbiddenText: '안되',
          inputText: '오늘은 날씨가 좋습니다.'
        },
        watch: {
          // 입력한 문자열을 감시한다.
          inputText: function(){
            //inputText프로퍼티가 계속변하기 때문에 watch에 살피다가 안되라는 단어가 나오면 삭제
            var pos = this.inputText.indexOf(this.forbiddenText);
            if (pos >= 0) {
              alert(this.forbiddenText + "는 입력할 수 없습니다.");
              this.inputText = this.inputText.substr(0,pos);
            }
          }
        }
      })
    </script>

</code>


## 9. component

- 컴포넌트는 같은 종류의 처리를 컴포넌트로 묶어 여러곳에서 사용하게 하는 방법이다.
- component를 등록하는 방법은 글로벌, 로컬 두가지가 있다.

### global

  - Vue.component('컴포넌트 태그', {template: "HTML 코드"});

- 글로벌은 위와같이 Vue.component를 사용해 등록할 수 있다. 이렇게 하면 이후에 생성되는 vue 인스턴스에서도 사용이 가능해진다.
- 전역변수와 같다. 하지만 글로벌은 사용하지 않아도 계속 남아있기 때문에 성능에 문제가 생길 수 있다.


### Local

- 로컬은 vue 인스턴스에 components 옵션을 통해 생성하는 방식이다.


<code class="codes">

    <div id="app">
      <!--컴포넌트 태그명을 사용해 컴포넌트 사용-->
      <my-component></my-component>
      <my-component></my-component>
      <my-component></my-component>
    </div>

    <script>
      //Component 변수
      var MyComponent = {
        template: `<p class="my-comp">Hello</p>`
      }
      new Vue({
        el: '#app',
        components: {     //컴포넌트 등록, 이후 컴포넌트태그를 HTML코드에 넣고 사용
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
        padding: 8px;
      }
    </style>

</code>



<code class="codes">

    <div id="app">
      <!--각기 다른 컴포넌트-->
      <my-component></my-component>
      <my-component></my-component>
      <my-component></my-component>
    </div>
    <script>
      //각기 다른 컴포넌트를 구성해 count 변수도 각 component에 적용된다.
      var MyComponent = {
        template: '<p class="my-comp">카운터  <button v-on:click="addOne">추가</button> {{ count }}</p>',
        data: function () {
          return {
            count: 0
          }
        },
        methods: {
          addOne: function() {
            this.count++;
          }
        },
      }
      new Vue({
        el: '#app',
        components: {
          'my-component': MyComponent
        }
      })
    </script>

</code>


### props

- 컴포넌트를 사용할 때 HTML의 컴포넌트 태그에서 데이터를 props를 이용해 전달 받을수 있다.
- 주의점은 props의 프로퍼티명은 myName과 같이 카멜케이스로 쓰고 HTML에서는 my-name처럼 케밥케이스로 쓴다.


<code class="codes">

    <h2>컴포넌트에 값을 전달하는 예제</h2>
    <div id="app">
      <!--my-name태그로 myName 프로퍼티에 값을 전달한다.-->
      <my-component my-name="철수"></my-component>
      <my-component my-name="영희"></my-component>
      <my-component></my-component>
    </div>

    <script>
      var MyComponent = {
        template: '<p class="my-comp">나는 {{ myName }} 입니다.</p>',
        props: {
          myName: String	//my-name으로부터 값을 받는다.
        },
      }
      new Vue({
        el: '#app',
        components: {
          'my-component': MyComponent
        }
      })
    </script>

</code>
