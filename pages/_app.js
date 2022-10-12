import { useEffect } from 'react'
import '../styles/globals.css'

function MyApp({ Component, pageProps }) {
  useEffect(() => {
    console.log(`
  
    ${process.env.NEXT_PUBLIC_TESTE}
  
  `)
  },[]);
  return <Component {...pageProps} />
}

export default MyApp
