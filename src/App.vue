<script setup>
import Unavailable from './components/unavailable.vue';
import { ref, onMounted } from 'vue'
import './assets/style.css'
import axios from 'axios';


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




function nextProduct() {
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

function categoryProduct(product) {
  console.log("hello")
  if (!product || !product.category) {
    return false
  }
  if (product.category === "men's clothing") {
    return true
  }
  if (product.category === "women's clothing") {
    return false 
  }

return 'unavailable'
}
</script>



<template>
  <div :class="{ 'body-men': categoryProduct(item), 'body-women': !categoryProduct(item),'body-unavailable': categoryProduct(item) === 'unavailable' }"
    v-for="item in Products" :key="item.id">

    <div v-if="isHideProduct(item)">
      <Unavailable @buttonClicked="nextProduct" />
    </div>
    <div class=" card" v-else>
      <div class="card-picture">
        <img :src="item.image" alt="gambar produk" />

      </div>

      <div class="card-description">
        <div :class="{'description-text1-men': categoryProduct(item),'description-text1-women': !categoryProduct(item)}">
          {{ item.title }}
        </div>

        <div class="card-category-text">
          {{ item.category }}
          <div class="rating">
         <div>{{ item.rating.rate }}/</div> 
         <div> {{ item.rating.count }}</div>

        </div>
        </div>

        
        
          <hr class="line-hr">
  
        <div class="card-category-text-detail">
          {{ item.description }}
        </div>
        <hr class="line-hr1">
        <h1 :class="{'card-category-price-men': categoryProduct(item),'card-category-price-women': !categoryProduct(item)}" > ${{ item.price }}</h1>

        <div class="btn">
          <button :class="{'btn-buy-men': categoryProduct(item),'btn-buy-women': !categoryProduct(item)}">
             Buy Now
          </button>

          <button :class="{'btn-next-men': categoryProduct(item),'btn-next-women': !categoryProduct(item)}" @click="nextProduct">
            Next-Product
          </button>
        </div>

      </div>


    </div>
  </div>


  
</template>


<style>
body {
  margin: 0;
  padding: 0;
  font-family: 'Inter', sans-serif;
}



</style>
