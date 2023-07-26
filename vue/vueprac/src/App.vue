<template>

  <div class="menu">
    <a v-for="(a,i) in menus" :key="i">{{ menus[i] }}</a>
   </div>

   <Modal @closeModal="modal=false" :원룸들="원룸들" :modal="modal" :modalnum="modalnum" />

   <Card @openModal="modal=true; modalnum=$event" :원룸="원룸들[i]" v-for="(Card,i) in 원룸들" :key="Card" />

   <DisC />

  

  

  
  
</template>

<script>

import data from './oneroom.js'
import DisC from './Discount.vue'
import Modal from './components/ModalData.vue'
import Card from './components/CardData.vue'

export default {
  name: 'App',
  data() {
    return {
      원룸들 : data,
      modal : false,
      modalnum: 0,
      menus: ['Home', 'Shop', 'About'],
    }
  },
  components: {
    DisC: DisC,
    Modal: Modal,
    Card: Card,
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
}

body {
  margin: 0;
}
div {
  box-sizing: border-box;
}

.black-bg {
  width: 100%; height: 100%;
  background: rgba(0,0,0,0.5);
  position: fixed; padding: 20px;
}
.white-bg {
  width: 100%; background: white;
  border-radius: 8px;
  padding: 20px;
}

.menu {
  background: darkslateblue;
  padding: 15px;
  border-radius: 5px;
}

.menu a {
  color: white;
  padding: 10px;
}

.room-img {
  width: 100%;
  margin-top: 40px;
}

</style>
