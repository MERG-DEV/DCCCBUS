set_test_name()

beginning_of_test(248)
    begin_test
      --
      set_paired_outputs_off
      set_rcn213_linear_addressing_off
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_extnd_acc(0, 42)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high, 0, EN low, 42, Data)
      --
      input_dcc_extnd_acc(1, 33)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high, 1, EN low, 33, Data)
      --
      input_dcc_extnd_acc(502, 16)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(502), EN high,
                                                low_byte(502), EN low, 16, Data)
      --
      input_dcc_extnd_acc(503, 24)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(503), EN high,
                                                low_byte(503), EN low, 24, Data)
      --
      input_dcc_extnd_acc(1014, 7)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(1014), EN high,
                                                low_byte(1014), EN low, 7, Data)
      --
      input_dcc_extnd_acc(1013, 5)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(1013), EN high,
                                                low_byte(1013), EN low, 5, Data)
      --
      input_dcc_extnd_acc(2038, 1)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(2038), EN high,
                                                low_byte(2038), EN low, 1, Data)
      --
      input_dcc_extnd_acc(2043, 6)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(2043), EN high,
                                                low_byte(2043), EN low, 6, Data)
      --
end_of_test
