#include <iostream>

#define UNUSED(x) (void)(x)

int main(int argc, char const *argv[])
{
  UNUSED(argc); UNUSED(argv);

  std::cout << "Hello Premake" << std::endl;
  return 0;
}
