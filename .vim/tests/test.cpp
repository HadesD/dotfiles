#include <iostream>
#include <vector>
#include <string>
#include <thread>
#include <map>

class Test
{

};

int f = 1;

int main()
{
  int i;
  i = 1;

  std::thread f([](){
    int i = 1;
    for (; i < 10; i++)
    {
      int f;
      f = 3;
    }
  });

  // v<C-n>I
  // cs{[
  std::vector<std::string> v = { "f", "", "", "" };
}
