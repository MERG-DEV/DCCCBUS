set_test_name()

beginning_of_test(266)
  begin_test
    --
    configure_can
    --
    wait_until_slim -- Booted into SLiM
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high,
                                                  0, EN low, 42, Data)
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high,
                                                  1, EN low, 33, Data)
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
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(2038), EN high,
                                                   low_byte(2038), EN low,
                                                  1, Data)
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, high_byte(2043), EN high,
                                                   low_byte(2043), EN low,
                                                  6, Data)
    --
  end_test
  --
  input_dcc_packets: process is
    begin
      log(Begin DCC generation)
      input_dcc_idle
      log(Begin DCC packets)
      input_dcc_extnd_acc(0, 42)
      input_dcc_extnd_acc(1, 33)
      input_dcc_extnd_acc(502, 16)
      input_dcc_extnd_acc(503, 24)
      input_dcc_extnd_acc(1014, 7)
      input_dcc_extnd_acc(1013, 5)
      input_dcc_extnd_acc(2038, 1)
      input_dcc_extnd_acc(2043, 6)
      log(DCC packets complete)
      wait;
    end process input_dcc_packets;
  --
end testbench;
