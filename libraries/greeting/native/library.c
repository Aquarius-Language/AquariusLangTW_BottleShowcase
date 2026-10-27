#include <aqua/aqua.h>
static void echo(aqua_call *call) { aqua_return(call, aqua_arg(call, 0)); }
AQUA_LIBRARY(bottle_greeting) {
    aqua_class *module = aqua_define_module(library, "BottleGreetingNative|問候原生");
    aqua_define_function(module, "Echo|回音", echo, "s");
}
