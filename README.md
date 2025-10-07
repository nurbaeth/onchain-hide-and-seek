🕵️‍♀️ onchain-hide-and-seek           
A fully on-chain "Hide and Seek" game written in Solidity.          
One player hides in a secret spot, and another tries to find them.       
No tokens. No rewards. Just pure game logic on the blockchain.           
          
🎮 Game Flow        
Hider calls hide(spot) to choose a secret location (1–5).      
           
Seeker calls seek(guess) to try to find the hider.   
       
The game ends and the contract reveals the result.       
       
Anyone can call resetGame() to start over.    
          
✨ Features   
🧠 100% logic-based — no randomness, no dependencies.    
      
⚙️ Stateless rounds — simple hide/seek/reset loop.    
     
🛡️ Prevents the same player from hiding and seeking.    
        
🔒 Secret spot is stored privately (but visible on-chain for advanced seekers).   
 
