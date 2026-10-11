set_test_name()

beginning_of_test(908)
  begin_test
    --
    configure_can
    --
    wait_until_slim -- Booted into SLiM
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 1, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(502), EN high,
                                             low_byte(502), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(502), EN high,
                                             low_byte(502), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(503), EN high,
                                             low_byte(503), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(503), EN high,
                                             low_byte(503), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1014), EN high,
                                             low_byte(1014), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1014), EN high,
                                             low_byte(1014), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1013), EN high,
                                             low_byte(1013), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1013), EN high,
                                             low_byte(1013), EN low)
    --
    log(Pair 510 Deactivation translated as individual 1020 Activation)
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1020), EN high,
                                             low_byte(1020), EN low)
    --
    log(Pair 510 Activation translated as individual 1021 Activation)
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1021), EN high,
                                             low_byte(1021), EN low)
    --
    log(Pair 511 Deactivation translated as individual 1022 Activation)
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1022), EN high,
                                             low_byte(1022), EN low)
    --
    log(Pair 511 Activation translated as individual 1023 Activation)
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(1023), EN high,
                                             low_byte(1023), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2038), EN high,
                                             low_byte(2038), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2038), EN high,
                                             low_byte(2038), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(2040), EN high,
                                             low_byte(2040), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(2040), EN high,
                                             low_byte(2040), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(4084), EN high,
                                             low_byte(4084), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(4084), EN high,
                                             low_byte(4084), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(4086), EN high,
                                             low_byte(4086), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(4087), EN high,
                                             low_byte(4087), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(6), EN high,
                                             low_byte(6), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(7), EN high,
                                             low_byte(7), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(8), EN high,
                                             low_byte(8), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(9), EN high,
                                             low_byte(9), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(10), EN high,
                                             low_byte(10), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(11), EN high,
                                             low_byte(11), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(12), EN high,
                                             low_byte(12), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(13), EN high,
                                             low_byte(13), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(14), EN high,
                                             low_byte(14), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(15), EN high,
                                             low_byte(15), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(16), EN high,
                                             low_byte(16), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(17), EN high,
                                             low_byte(17), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, high_byte(18), EN high,
                                             low_byte(18), EN low)
    --
  end_test
  --
  input_dcc_packets: process is
    begin
      log(Begin DCC generation)
      input_dcc_idle
      log(Begin DCC packets)
      input_dcc_basic_acc(0, Deactivate)
      input_dcc_basic_acc(0, Activate)
      input_dcc_basic_acc(1, Deactivate)
      input_dcc_basic_acc(1, Activate)
      input_dcc_basic_acc(502, Deactivate)
      input_dcc_basic_acc(502, Activate)
      input_dcc_basic_acc(503, Deactivate)
      input_dcc_basic_acc(503, Activate)
      input_dcc_basic_acc(1014, Deactivate)
      input_dcc_basic_acc(1014, Activate)
      input_dcc_basic_acc(1013, Deactivate)
      input_dcc_basic_acc(1013, Activate)
      input_dcc_basic_acc_pair(510, Deactivate)
      input_dcc_basic_acc_pair(510, Activate)
      input_dcc_basic_acc_pair(511, Deactivate)
      input_dcc_basic_acc_pair(511, Activate)
      input_dcc_basic_acc(2038, Deactivate)
      input_dcc_basic_acc(2038, Activate)
      input_dcc_basic_acc(2040, Deactivate)
      input_dcc_basic_acc(2040, Activate)
      input_dcc_basic_acc(4084, Deactivate)
      input_dcc_basic_acc(4084, Activate)
      input_dcc_basic_acc(4086, Deactivate)
      input_dcc_basic_acc(4087, Activate)
      input_dcc_basic_acc(6, Activate)
      input_dcc_basic_acc(7, Activate)
      input_dcc_basic_acc(8, Activate)
      input_dcc_basic_acc(9, Activate)
      input_dcc_basic_acc(10, Activate)
      input_dcc_basic_acc(11, Activate)
      input_dcc_basic_acc(12, Activate)
      input_dcc_basic_acc(13, Activate)
      input_dcc_basic_acc(14, Activate)
      input_dcc_basic_acc(15, Activate)
      input_dcc_basic_acc(16, Activate)
      input_dcc_basic_acc(17, Activate)
      input_dcc_basic_acc(18, Activate)
      log(DCC packets complete)
      wait;
    end process input_dcc_packets;
  --
end testbench;
