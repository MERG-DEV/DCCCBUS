set_test_name()

beginning_of_test(202)
    begin_test
      --
      set_paired_outputs_off
      set_rcn213_linear_addressing_off
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_basic_acc(0, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
      --
      input_dcc_extnd_acc_invalid_byte_2_a
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc(1, Activate)
      tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 1, EN low)
      --
      input_dcc_extnd_acc_invalid_byte_2_b
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc(2, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 2, EN low)
      --
      input_dcc_extnd_acc_invalid_byte_2_c
      tx_check_for_no_message(1, DCC event)
      --
      input_dcc_basic_acc(3, Deactivate)
      tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 3, EN low)
      --
end_of_test
