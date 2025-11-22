set_test_name()

beginning_of_test(280)
    begin_test
      --
      set_cancmd_addressing_on
      --
      configure_can
      --
      wait_until_slim -- Booted into SLiM
      --
      input_dcc_extnd_acc(4, 42)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high, 0, EN low, 42, Data)
      --
      input_dcc_extnd_acc(5, 33)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high, 1, EN low, 33, Data)
      --
      input_dcc_extnd_acc(505, 16)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(501), EN high,
                                                low_byte(501), EN low, 16, Data)
      --
      input_dcc_extnd_acc(506, 24)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(502), EN high,
                                                low_byte(502), EN low, 24, Data)
      --
      input_dcc_extnd_acc(1017, 7)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(1013), EN high,
                                                low_byte(1013), EN low, 7, Data)
      --
      input_dcc_extnd_acc(1016, 5)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(1012), EN high,
                                                low_byte(1012), EN low, 5, Data)
      --
      input_dcc_extnd_acc(2047, 1)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(2043), EN high,
                                                low_byte(2043), EN low, 1, Data)
      --
      input_dcc_extnd_acc(0, 6)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(2044), EN high,
                                                low_byte(2044), EN low, 6, Data)
      --
      input_dcc_extnd_acc(3, 6)
      tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(2047), EN high,
                                                low_byte(2047), EN low, 6, Data)
      --
end_of_test
