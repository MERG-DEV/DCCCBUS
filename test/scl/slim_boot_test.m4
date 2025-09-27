set_test_name()dnl

beginning_of_test(5)
    begin_test
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      if flim_led == '1' then
        log(Yellow LED (FLiM) on)
        test_state := fail;
      end if;
      --
end_of_test
