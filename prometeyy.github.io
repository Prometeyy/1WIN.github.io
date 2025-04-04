<!DOCTYPE html>
 <html lang="en">
 <head>
     <!-- Google tag (gtag.js) -->
     <script async src="https://www.googletagmanager.com/gtag/js?id=G-H3RBFH5510"></script>
     <script>
       window.dataLayer = window.dataLayer || [];
       function gtag(){dataLayer.push(arguments);}
       gtag('js', new Date());
       gtag('config', 'G-H3RBFH5510');
     </script>
     <meta charset="UTF-8">
     <meta name="viewport" content="width=device-width, initial-scale=1.0">
     <title>Document</title>
     <link rel="preconnect" href="https://fonts.googleapis.com">
     <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
     <link href="https://fonts.googleapis.com/css2?family=IBM+Plex+Sans&display=swap" rel="stylesheet">
 </head>
 <style>
     body {
         margin: 0;
         padding: 0;
     }
 
     .container {
         position: relative;
         width: 100vw;
         height: 100vh;
         display: flex;
         flex-direction: column;
         align-items: center;
         justify-content: center;
         background-color: black;
     }
 
     .custom-loader {
         position: relative;
         width: 200px;
         height: 200px;
         border-radius: 50%;
         border: 8px solid;
         border-color: #0aff16 transparent;
         animation: s1 1s linear infinite;
     }
 
     @keyframes s1 {
         to {
             transform: rotate(1turn);
         }
     }
 
     .lh {
         color: white;
         font-size: 35px;
         font-weight: 15px;
         font-family: 'IBM Plex Sans', sans-serif;
         position: absolute;
         top: 20%;
     }
 
     .tg {
         color: white;
         font-size: 20px;
         font-family: 'IBM Plex Sans', sans-serif;
         position: absolute;
         top: 70%;
     }
 
     .input-container {
         position: absolute;
         top: 50%;
         transform: translateY(-50%);
         display: none;
         text-align: center;
     }
 
     .input-container input {
         font-size: 20px;
         padding: 10px;
         width: 200px;
         color: white;
         background-color: black;
         border: 2px solid #0aff16;
         border-radius: 5px;
         text-align: center;
     }
 
     .prompt-message {
         color: red;
         font-size: 18px;
         font-family: 'IBM Plex Sans', sans-serif;
         position: absolute;
         margin-top: 10px;
         margin-left: 30px;
         text-align: center;
     }
 
     .error-message {
         color: red;
         font-size: 18px;
         font-family: 'IBM Plex Sans', sans-serif;
         margin-top: 10px;
         display: none;
         width: 300px;
     }
 
     .loader-content {
         position: absolute;
         top: 50%;
         left: 50%;
         transform: translate(-50%, -50%);
         color: white;
         font-size: 20px;
         font-family: 'IBM Plex Sans', sans-serif;
     }
 
     /* Animation for the dots */
     .dots-container {
         display: flex;
         justify-content: center;
         margin-top: 20px;
         display: none;
     }
 
     .dot {
         width: 10px;
         height: 10px;
         margin: 0 5px;
         background-color: #0aff16;
         border-radius: 50%;
         animation: dot-blink 1.5s infinite ease-in-out;
     }
 
     .dot:nth-child(1) {
         animation-delay: 0s;
     }
 
     .dot:nth-child(2) {
         animation-delay: 0.3s;
     }
 
     .dot:nth-child(3) {
         animation-delay: 0.6s;
     }
 
     @keyframes dot-blink {
         0%, 100% {
             opacity: 0;
         }
         50% {
             opacity: 1;
         }
     }
 
 </style>
 <body>
     <div class="container">
         <div class="lh"><b>LET'S HACK</b></div>
         <div class="custom-loader" id="loader"></div>
         <div class="loader-content">Подключение</div>
         <div class="input-container" id="inputContainer">
             <input type="text" id="textInput" placeholder="Enter ID" onfocus="hidePrompt()" onkeydown="checkPromoCode(event)">
             <div class="prompt-message" id="promptMessage">Введите ID аккаунта</div>
             <div class="error-message" id="errorMessage">Баланс должен быть не менее 1000 рублей!</div>
             <!-- Dots animation -->
             <div class="dots-container" id="dotsContainer">
                 <div class="dot"></div>
                 <div class="dot"></div>
                 <div class="dot"></div>
             </div>
         </div>
         <div class="tg"><b>LUCKY JET HACK</b></div>
     </div>
 
     <script>
         var loader = document.getElementById('loader');
         var inputContainer = document.getElementById('inputContainer');
         var loaderContent = document.querySelector('.loader-content');
         var rotationCount = 0;
         var attemptCount = 0; // Счетчик попыток
 
         loader.addEventListener('animationiteration', function () {
             rotationCount++;
 
             if (rotationCount === 6) {
                 loader.style.animation = 'none';
                 loader.style.border = 'none';
                 loaderContent.style.display = 'none';
                 inputContainer.style.display = 'block';
             }
         });
 
         function checkPromoCode(event) {
             if (event.key === 'Enter') {
                 var input = document.getElementById('textInput').value;
                 var errorMessage = document.getElementById('errorMessage');
                 var dotsContainer = document.getElementById('dotsContainer');
 
                 errorMessage.style.display = 'none';
                 dotsContainer.style.display = 'flex';
 
                 setTimeout(function() {
                     if (!/^\d+$/.test(input)) {
                         errorMessage.textContent = "Неверный ID.";
                         errorMessage.style.display = 'block';
                     } else {
                         attemptCount++;
                         if (attemptCount % 2 === 1) { // Нечетная попытка
                             errorMessage.textContent = "Аккаунт не зарегистрирован по промокоду HACKWINS!";
                         } else { // Четная попытка
                             errorMessage.textContent = "Нужно пополнить аккаунт минимум на 1000 рублей!";
                         }
                         errorMessage.style.display = 'block';
                     }
                     dotsContainer.style.display = 'none';
                 }, 1500);
             }
         }
 
         function hidePrompt() {
             var promptMessage = document.getElementById('promptMessage');
             promptMessage.style.display = 'none';
         }
     </script>
 </body>
 </html>