<template>
   <div class="black-bg" v-if="modal==true">
      <div class="white-bg">
        <img :src="원룸들[modalnum].image">
        <h4>{{ 원룸들[modalnum].title }}</h4>
        <p>{{ 원룸들[modalnum].content }}</p>
        <p>{{ 원룸들[modalnum].price }}원</p>
        <DisC />
        <button @click="$emit('closeModal')">닫기</button>
      </div>
   </div>
</template>

<script>
export default {
    name: 'ModalWindow',
    props : {
        원룸들: Array,
        modal: Boolean,
        modalnum: Number,
    }
}
</script>

<style>

</style>