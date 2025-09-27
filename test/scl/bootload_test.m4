set_test_name()dnl
configuration for "processor_type" is
  shared label    _CANMain;
end configuration;
--
testbench for "processor_type" is
begin
  timeout_process(1)
  test_name: process is
    type test_result is (pass, fail);
    variable test_state : test_result;
    begin
      log(START)
      test_state := pass;
      --
      wait until PC == _CANMain;
      log(Reached _CANMain)
      --
end_of_test
