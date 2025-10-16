<script setup>
import Unavailable from './components/unavailable.vue';
import { ref, onMounted } from 'vue'
import axios from 'axios';
import './assets/style.css'


const Products = ref([])
const id = ref(1)


function getProduct() {
  axios.get(`https://fakestoreapi.com/products/${id.value}`)
    .then((res) => {
      Products.value = [res.data]
    })
    .catch((err) => {
      console.error('Error:', err)
    })
}




function NextProduct() {
  id.value++
  getProduct()
  console.log(id.value)
  if (id.value >= 20) {
    id.value = 0
  }
}


onMounted(() => {
  getProduct()
})



function isHideProduct(product) {
  console.log(product.category)
  if (product.category === "men's clothing" || product.category === "women's clothing") {
    return false
  }

  return true
}

function isMen(product) {
  console.log("hello")
  if (!product || !product.category) {
    return true
  }
  if (product.category === "men's clothing") {
    return true
  }
  if (product.category === "women's clothing") {
    return false
  }
  return true

}



</script>



<template>
  <div :class="{ 'body-men': isMen(item), 'body-women': !isMen(item) }" v-for="item in Products" :key="item.id">
    <div v-if="isHideProduct(item)">
      <Unavailable @buttonClicked="NextProduct" />
    </div>
    <div class=" card" v-else>
      <div class="card-picture">
        <img :src="item.image" alt="gambar produk" />

      </div>

      <div class="card-description">
        <div class="card-description-text1">
          {{ item.title }}
        </div>

        <div class="card-category-text">
          {{ item.category }}
        </div>

        <div class="rating">
          {{ item.rating.rate }}
          {{ item.rating.count }}

        </div>
        <div class="line">
          <hr class="line-hr">
        </div>


        <div class="card-category-text-detail">
          {{ item.description }}
        </div>
        <hr class="line-hr1">
        <h1 class="card-category-price"> ${{ item.price }}</h1>

        <div class="btn">
          <button class="btn-buy">Buy Now</button>
          <button class="btn-next" @click="NextProduct">Next-Product</button>
        </div>

      </div>


    </div>
  </div>


  
</template>


<style>
body {
  margin: 0;
  padding: 0;
}

.body-women {
    margin: auto;
    background-color: #FDE2FF;
    width: auto;
    height: 540px;
    display: flex;
    justify-content: center;
    align-items: center;

}
.body-men {
    margin: auto;
    background-color: #D6E6FF;
    width: auto;
    height: 540px;
    display: flex;
    justify-content: center;
    align-items: center;

}


.men {
  background-color: red;
  width: 100px;
  height: 100px;
}

.women {
  background-color: blue;
  width: 100px;
  height: 100px;
}
</style>
