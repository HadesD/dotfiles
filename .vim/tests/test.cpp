#include <functional>
#include <iostream>
#include <map>
#include <string>
#include <thread>
#include <tuple>
#include <vector>
#include <future>

namespace test::names {
  template <typename T>
  class TestClass {
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
  class TestIndent {
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

  std::thread f([]() {
    int i = 1;
    for (; i < 10; i++) {
      int f;
      f = 3;
    }
  });

  std::async(
   std::launch::async,
   [](){
     int a = 1;
   }
   );

  std::map<std::pair<int, int>, int> m;
  m[{1, 2}] = 3;

  std::vector<std::string> v();

  std::vector<std::string> v3 = {"f", "", "", ""};
}

