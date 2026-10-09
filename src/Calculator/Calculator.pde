//Xander Warner | September 15 | 2026 | Calculator
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[10];
float l, r, result;
char op;
boolean left;
String displayVal;
boolean newEntry;

void setup() {
  size(310, 450);
  l = 0.0;
  r = 0.0;
  result = 0.0;
  op = ' ' ;
  left = true;
  newEntry = true;
  displayVal= "0.0";
  numButtons[0] = new Button(40, 360, 50, 45, '0');
  numButtons[1] = new Button(40, 305, 50, 45, '1');
  numButtons[2] = new Button(105, 305, 50, 45, '2');
  numButtons[3] = new Button(170, 305, 50, 45, '3');
  numButtons[4] = new Button(40, 250, 50, 45, '4');
  numButtons[5] = new Button(105, 250, 50, 45, '5');
  numButtons[6] = new Button(170, 250, 50, 45, '6');
  numButtons[7] = new Button(40, 195, 50, 45, '7');
  numButtons[8] = new Button(105, 195, 50, 45, '8');
  numButtons[9] = new Button(170, 195, 50, 45, '9');
  opButtons[0]  = new Button(40, 140, 50, 45, 'C');
  opButtons[1]  = new Button(105, 140, 50, 45, '±');
  opButtons[2]  = new Button(170, 140, 50, 45, '%');
  opButtons[3]  = new Button(235, 140, 50, 45, '÷');
  opButtons[4]  = new Button(235, 195, 50, 45, 'x');
  opButtons[5]  = new Button(235, 250, 50, 45, '-');
  opButtons[6]  = new Button(235, 305, 50, 45, '+');
  opButtons[7]  = new Button(105, 360, 50, 45, '.');
  opButtons[8]  = new Button(170, 360, 50, 45, '^');
  opButtons[9]  = new Button(235, 360, 50, 45, '=');
}

void draw() {
  background(#404AF2);
  drawdisplay();

  for (int i =0; i<numButtons.length; i++) {
    textSize(20);
    numButtons [i].display();
    numButtons[i].mouseOver(mouseX, mouseY);
  }

  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].mouseOver(mouseX, mouseY);
  }
}

void drawdisplay() {
  rectMode(CENTER);
  fill(#DCDDF7);
  rect(width/2, 60, 300, 80);
  fill(#3E3E43);
  textAlign(RIGHT);
  textSize(45);
  text(displayVal, width-40, 90);
}
void mouseReleased() {

  for (int i = 0; i < numButtons.length; i++) {
    if (numButtons[i].hover) {
      handleEvent(numButtons[i].val, true);
    }
  }
  for (int i = 0; i < opButtons.length; i++) {
    if (opButtons[i].hover) {
      handleEvent(opButtons[i].val, false);
    }



    println("L: " + l);
    println("R: " + r);
    println("Result: " + result);
    println("Left: " + left);
    println("Op: " + op);
  }
}


void performCalc() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '÷') {
    result = l / r;
  } else if (op == 'x') {
    result = l * r;
  }
  displayVal= str(result);
  left = !left;
  left = !left;
  r=0.0;
}

void keyPressed() {
  println("KeyCode; " + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent('1', true);
  } else if (keyCode == 49 || keyCode == 98) {
    handleEvent('2', true);
  } else if (keyCode == 50 || keyCode == 109) {
    handleEvent('-', false);
  } else if (keyCode == 51) {
    handleEvent('+', false);
  }
}
void handleEvent(char val, boolean isNum) {
  if (isNum == true) {
    //do number stuff
    String digit = str(val);

    if (newEntry || displayVal.equals("0.0")) {
      displayVal = digit;
      newEntry = false;
    } else {
      displayVal += digit;
    }

    if (left) {
      l = float(displayVal);
    } else {
      r = float(displayVal);
    }
    for (int i = 0; i < numButtons.length; i++) {
      if (numButtons[i].hover) {
      }
    }
  } else {

    char clicked = val;

    if (clicked == '=') {
      performCalc();
    } else if (clicked == '+' || clicked == '-' ||
      clicked == 'x' || clicked == '÷') {
      op = clicked;
      left = !left;
      newEntry = true;
      displayVal = str(op);
    } else if (clicked == '±') {
      if (left == true) {
        l *= -1;
        displayVal = str(l);
      } else {
        r *= -1;
        displayVal = str(r);
      }
    } else if (clicked == 'C') {

      l = 0.0;
      r = 0.0;
      result = 0.0;
      op = ' ';
      displayVal = "0.0";
      left = true;
      newEntry = true;
    } else if (clicked == '√') {

      if (left == true) {
        l = sqrt(l);
        displayVal = str(l);
      } else {
        r = sqrt(r);
        displayVal = str(r);
      }
    } else if (clicked == 'π') {
      if (left == true) {
        l = 3.14159265359;
        displayVal = str(l);
      }
    } else if (clicked == '.') {
      if (!displayVal.contains(".")) {
        displayVal+= ".";
      }
    }
  }
}
