function calculaVeloc(){
    let velo_max = Number(document.getElementById("velo_max").value)
                
    let velo= Number(document.getElementById("velo").value)
        
    let saida=document.getElementById("multa")
                
    let limite1 = velo_max*0.2
                
    if (velo > velo_max){
        let diferenca= velo-velo_max
        let porcentagem= diferenca/velo_max*100
        let multa = "" 
        let cor= "" 
        let corL =""
                        
        if(porcentagem <=20){
            multa = "R$ 130,16"
            cor="green"
            corL="white"
                        
        } else if (porcentagem <=50){
            multa = "R$ 195,23"  
            cor="yellow" 
            corL="black"
                        
        } else {            
            multa = "R$ 880,41"  
            cor="red"
            corL="black"
                        
        }
        saida.style.backgroundColor=cor       
        saida.innerText = "Você excedeu " + porcentagem + "% da velocidade máxima. Sua multa é de " + multa
                    
    }else{            
        saida.innerText = "Sem Multas"        
    }
}
            