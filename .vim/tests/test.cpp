#include <thread>

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
}
