<template>
   <div class="black-bg" v-if="modal==true">
      <div class="white-bg">
        <img :src="원룸들[modalnum].image">
        <h4>{{ 원룸들[modalnum].title }}</h4>
        <p>{{ 원룸들[modalnum].content }}</p>
        <input v-model.number="month">
        <p> {{ month }}개월 선택 : {{ 원룸들[modalnum].price * month }}원</p>
        <DisC />
        <button @click="$emit('closeModal')">닫기</button>
      </div>
   </div>
</template>

<script>
export default {
    name: 'ModalWindow',
    data() {
      return {
        month : 1,
      }
    },
    props : {
        원룸들: Array,
        modal: Boolean,
        modalnum: Number,
    }
}
</script>

<style>

</style>