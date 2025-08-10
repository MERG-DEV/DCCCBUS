define(test_name, patsubst(__file__, {.m4},))dnl

beginning_of_test(3)
    begin_test
       set_can_rx_recessive
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
end_of_test
