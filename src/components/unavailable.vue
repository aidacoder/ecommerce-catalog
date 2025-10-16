<script setup>
import { defineEmits } from 'vue';
const emit = defineEmits(['buttonClicked']);

const handleClick = () => {
  emit('buttonClicked');
};

</script>

<template>
    <div class="body-unavailable">
        <div class="card">
            <div class="card-text">
                <p>This product is unavailable to show</p>
                <button @click="handleClick">Next product</button>
            </div>


        </div>
    </div>

 

</template>


<style scoped>
.body-unavailable {
    background-color: #DCDCDC;
    width: auto;
    height: 540px;
    display: flex;
    justify-content: center;
    align-items: center;

}


.card {
    width: 834px;
    height: 480px;
    display: flex;
    justify-content: center;
    align-items: center;
    background-image: url('/images/sad-face.svg');
    background-repeat: no-repeat;
    background-size: contain;
    background-position: center;
    background-color: white;
}
.card-text button{
    width: 230px;
}
</style>