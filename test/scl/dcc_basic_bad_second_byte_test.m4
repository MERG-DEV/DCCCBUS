set_test_name()

beginning_of_test(131)
    begin_test
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_basic_acc_pair(0, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_basic_acc_pair_invalid_byte_2_start
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc_pair(512, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(512), EN high,
                                               low_byte(512), EN low)
      --
      input_dcc_basic_acc_pair_invalid_byte_2_activation
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc_pair(1024, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1024), EN high,
                                               low_byte(1024), EN low)
      --
end_of_test
