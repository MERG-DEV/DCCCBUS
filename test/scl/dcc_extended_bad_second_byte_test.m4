set_test_name()

beginning_of_test(202)
    begin_test
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_basic_acc(0, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_extnd_acc_invalid_byte_2_a
      can_tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc(1, Activate)
      can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_extnd_acc_invalid_byte_2_b
      can_tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc(2, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 2, EN low)
      --
      input_dcc_extnd_acc_invalid_byte_2_c
      can_tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc(3, Deactivate)
      can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 3, EN low)
      --
end_of_test
