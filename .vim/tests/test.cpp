#include <iostream>
#include <string>
#include <thread>
#include <vector>
#include <map>

namespace test::names
{
  template<typename T>
  class TestClass
  {
    public:
      TestClass();
      ~TestClass();
    public:
      template<typename T>
      int d()
      {
        T a;
      }
  };
}

// sdfsdf
/**
 *
 *
 *
 *
 */
// Test();

/**
 *
 *
 *
 *
 *
 */
enum class TestEnum
{
  sfdsdf,
  FFF,
  TEST,
};

class Test
{
  public:
    template<typename S>
    struct FF : public S
    {
    };
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

  std::map<std::pair<int, int>, int> m;
  m[{1, 2}] = 3;

  std::vector<std::string> v();

  std::vector<std::string> v3 = { "f", "", "", "" };
}

