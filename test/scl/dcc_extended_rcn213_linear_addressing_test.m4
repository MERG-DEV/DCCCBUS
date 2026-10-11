set_test_name()

beginning_of_test(266)
  begin_test
    --
    set_rcn213_linear_addressing_on
    --
    configure_can
    --
    wait_until_slim -- Booted into SLiM
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high,
                                                  1, EN low, 42, Data)
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high,
                                                  2, EN low, 33, Data)
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(502), EN high,
                                                   low_byte(502), EN low,
                                                  16, Data)
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(503), EN high,
                                                   low_byte(503), EN low,
                                                  24, Data)
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(1014), EN high,
                                                   low_byte(1014), EN low,
                                                  7, Data)
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(1013), EN high,
                                                   low_byte(1013), EN low,
                                                  5, Data)
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(2044), EN high,
                                                   low_byte(2044), EN low,
                                                  1, Data)
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(2045), EN high,
                                                   low_byte(2045), EN low,
                                                  6, Data)
    --
  end_test
  --
  input_dcc_packets: process is
    begin
      log(Begin DCC generation)
      input_dcc_idle
      log(Begin DCC packets)
      input_dcc_extnd_acc(4, 42)
      input_dcc_extnd_acc(5, 33)
      input_dcc_extnd_acc(505, 16)
      input_dcc_extnd_acc(506, 24)
      input_dcc_extnd_acc(1017, 7)
      input_dcc_extnd_acc(1016, 5)
      input_dcc_extnd_acc(2047, 1)
      input_dcc_extnd_acc(0, 6)
      log(DCC packets complete)
      wait;
    end process input_dcc_packets;
  --
end testbench;
