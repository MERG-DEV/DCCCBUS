set_test_name()

beginning_of_test(500)
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
      input_dcc_basic_acc_second_of_pair(380)
      -- if flim_led == '1' then
      --   report("test_name: Yellow LED (FLiM) now on");
      -- end if;
      -- tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 380, EN low)
      --
end_of_test
