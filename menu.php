<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Menu bar</title>
    <link rel="stylesheet" href="style.css">
    <link href="https://cdn.jsdelivr.net/npm/remixicon@4.1.0/fonts/remixicon.css" rel="stylesheet"/>
    <style>
    

:root {
  --white: #ffffff;
  --light-grey: #edf0f1;
  --violet: #4070f4;
  --dark-violet: #4070f4;
  --black: #21232a;
}

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

.body{
  background: #f0faff;

}

ul {
  list-style: none;
}

a {
  color: inherit;
  text-decoration: none;
}

body {
  overflow: hidden;
  width: 100vw;
  height: 100vh;
  font-family: "Inter", sans-serif;
  text-align: center;
  padding: 0 20px;
  background: var(--light-grey);
  color: var(--white);
}

.notification {
  position: absolute;
  top: 0;
  right: 0;
  padding: 10px;
  background: var(--violet);
}



.nav {
  position: relative;
  display: flex;
  justify-content: center;
  max-width: 400px;
  padding-bottom: 20px;
  border-radius: 5px 5px 25px 25px;
  margin: 500px auto 0;
  background: var(--white);
  box-shadow: rgb(50 50 93 / 10%) 0 30px 60px -12px,
    rgb(0 0 0 / 15%) 0 18px 36px -18px;
}

.nav [type="checkbox"] {
  position: absolute;
  left: -9999px;
}

.nav [type="checkbox"] + label {
  position: relative;
  width: 75px;
  height: 75px;
  display: flex;
  align-items: center;
  justify-content: center;
  font-size: 16px;
  cursor: pointer;
  z-index: 1;
  background: var(--violet);
  border-radius: 50%;
  transform: translateY(-50%);
  transition: all 0.2s;
}

.nav [type="checkbox"] + label:hover {
  background: var(--dark-violet);
}

.menu li {
  position: absolute;
  top: -25px;
  left: 50%;
  transform: translateX(-50%);
  transition: all 0.4s;
}

.menu li:nth-child(1) {
  transition-delay: 0.2s;
}

.menu li:nth-child(2) {
  transition-delay: 0.15s;
}

.menu li:nth-child(3) {
  transition-delay: 0.1s;
}

.menu li:nth-child(4) {
  transition-delay: 0.05s;
}

.menu li a {
  width: 50px;
  height: 50px;
  border-radius: 50%;
  display: flex;
  align-items: center;
  justify-content: center;
  background: var(--violet);
}

.menu li a span {
  position: absolute;
  top: 0;
  left: 0;
  transform: translateY(calc(-100% - 5px));
  width: 100%;
  font-size: 13px;
  white-space: nowrap;
  pointer-events: none;
  opacity: 0;
  transition: opacity 0.3s;
  color: var(--black);
  font-weight: bold;
}

.nav input:checked + label {
  background: var(--black);
  transform: translateY(calc(-50% + 4px));
}

.nav input:checked ~ .menu li:nth-child(1) {
  top: -210px;
  transition-delay: 0.1s;
}

.nav input:checked ~ .menu li:nth-child(2) {
  top: -160px;
  left: calc(50% - 75px);
  transition-delay: 0.2s;
}

.nav input:checked ~ .menu li:nth-child(3) {
  top: -160px;
  left: calc(50% + 75px);
  transition-delay: 0.3s;
}

.nav input:checked ~ .menu li:nth-child(4) {
  top: -110px;
  transition-delay: 0.4s;
}

.nav input:checked ~ .menu li a span {
  opacity: 1;
  transition-delay: 0.9s;
}
    </style>
</head>
<body>
  <center>
    <div class="container">
        <nav class="nav">
            <input id="menu" type="checkbox">
            <label for="menu">Menu</label>
            <ul class="menu">
              <li>
                <a href="VulTemplate.php">
                  <span>Template</span>
                  <i class="ri-file-excel-2-fill "></i>
                </a>
              </li>
              <li>
                <a href="file.php">
                  <span>Insert File</span>
                  <i class="ri-file-fill"></i>
                </a>
              </li>
              <li>
                <a href="clients.php">
                  <span>Clients</span>
                  <i class="ri-team-line"></i>
                </a>
              </li>
              <li>
                <a href="sendmail.php">
                  <span>Send Mail</span>
                  <i class="ri-mail-fill"></i>
                </a>
              </li>
            </ul>
        </nav>
    </div>
  </center>
</body>
</html>