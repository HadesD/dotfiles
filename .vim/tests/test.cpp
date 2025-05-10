#include <functional>
#include <iostream>
#include <map>
#include <string>
#include <thread>
#include <tuple>
#include <vector>
#include <future>

#

std::tuple<std::string, std::vector<std::string>> TestFunc()
{
  return {};
}

namespace test::names
{
  template <typename T>
  class TestClass
  {
    public:
      TestClass();
      ~TestClass();

    public:
      void testCase(const std::string &t);

      template <typename T1>
      int d() {
        T a;

        return a;
      }
  };

  template <typename T, typename Arg, typename... Args>
  class TestIndent :
    public TestClass<T>
  {
    private:
      int a = 1;

    private:
      std::function<std::string(const std::vector<std::string> &)> f;
      std::tuple<std::string, int> t;
      std::tuple<
      int,
      char,
      float,
      bool, double,
      std::string,
      std::vector<
      std::string
      >,
      std::tuple<int, float, bool>
      > t2;

    public:
      TestIndent();
  };
} // namespace test::names

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

class Test {
  public:
    template <typename S>
    struct FF : public S
    {
    };
};

int f = 1;

int main() {
  int i;

  i = 1;

  if (i > 100)
  {
    i = 100;
  }

  std::to_string(i);

  if (
    (i >= 100) ||
    (i < 1000)
    )
  {
  }
  else if (1)
  {
  }
  else
  {
  }

  std::thread f([](){
    for (int i = 1; i < 10; i++) {
      int f;
      f = 3;
      std::to_string(f);
    }
  });

  std::function<std::string&(const int v, const std::vector<int>& mv)> ftest;

  auto ftt = [](
    const std::string& e,
    const std::array<std::string, 2>& aa
    ){
  };

  std::async(std::launch::async, [](){
    int a = 1;
  });

  std::map<std::pair<int, int>, int> m;
  m[{1, 2}] = 3;

  std::vector<std::string> v();

  std::vector<std::string> v3 = {"f", "", "", ""};

  switch(1)
  {
    case 1: {
      int f;
    } break;
    case 2: {
    } break;
    default:
      break;
  }
}

