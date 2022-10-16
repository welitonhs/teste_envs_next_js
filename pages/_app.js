import { useEffect } from 'react'
import '../styles/globals.css'

function MyApp({ Component, pageProps }) {
  useEffect(() => {
    console.log(`

    inicio console! 1.2
  
    ENV AQUI => ${process.env.NEXT_PUBLIC_TESTE}

    fim console!
  
  `)
  },[]);
  return <Component {...pageProps} />
}

export default MyApp
