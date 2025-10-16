import axios from 'axios'

const API_URL = 'https://fakestoreapi.com/products'

export function getProducts() {
  return axios.get(API_URL) 
}
