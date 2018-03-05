<?php
$f = [
  '' => '',
];

$b = '123123';

function c()
{
  switch ($b)
  {
    case 1:
      c();
      break;
    case 2:
      f();
      break;
    default:
      ff();
  }

  if (1 === 2)
  {
    echo 2;
  }
  elseif (1 !== 2)
  {
    echo 1;
  }
}

for ($i = 0;$i < 10;$i++);
