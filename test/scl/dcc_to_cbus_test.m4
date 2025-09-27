set_test_name()

beginning_of_test(500)
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
      input_dcc_basic_acc_pair(765, Off)
      -- tx_wait_for_node_message(OPC_ASOF, 765, 0, 0, EN high, 380, EN low)
      --
      input_dcc_basic_acc_pair(765, On)
      -- tx_wait_for_node_message(OPC_ASON, 765, 0, 0, EN high, 380, EN low)
      --
end_of_test
