set_test_name()

beginning_of_test(30)
    begin_test
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      if flim_led == '1' then
        report("test_name: Yellow LED (FLiM) on");
        test_state := fail;
      end if;
      --
      input_dcc_basic_acc(760)
      --
end_of_test
