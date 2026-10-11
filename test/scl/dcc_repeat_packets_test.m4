set_test_name()

beginning_of_test(706)
  begin_test
    --
    set_paired_outputs_on
    --
    configure_can
    --
    wait_until_slim -- Booted into SLiM
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
    --
    log(0 Deactivation repeat ignored)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
    --
    log(0 Activation repeat ignored)
    --
    log(0 Activation repeat ignored)
    --
    log(0 Activation repeat ignored)
    --
    log(0 Activation repeat ignored)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON, 0, 0, 0, EN high, 0, EN low)
    --
    log(Individual 510 Activation translated as pair 255 Deactivation)
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(255), EN high,
                                                  low_byte(255), EN low)
    --
    log(Individual 510 Activation repeat ignored)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(1019), EN high,
                                                  low_byte(1019), EN low)
    --
    log(Individual 510 Activation translated as pair 255 Deactivation)
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, high_byte(255), EN high,
                                                  low_byte(255), EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high,
                                                  0, EN low, 42, Data)
    --
    log(Extended 0 repeat ignored)
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high,
                                                  1, EN low, 33, Data)
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high,
                                                  0, EN low, 42, Data)
    --
    log(Extended 0 repeat ignored)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 0, EN low)
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high,
                                                  0, EN low, 42, Data)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
    --
    log(1 Deactivation repeat ignored)
    --
    can_tx_wait_for_node_message(OPC_ASON1, 0, 0, 0, EN high,
                                                  0, EN low, 42, Data)
    --
    can_tx_wait_for_node_message(OPC_ASOF, 0, 0, 0, EN high, 1, EN low)
    --
  end_test
  --
  input_dcc_packets: process is
    begin
      log(Begin DCC generation)
      input_dcc_idle
      log(Begin DCC packets)
      input_dcc_basic_acc_pair(0, Deactivate)
      input_dcc_basic_acc_pair(0, Deactivate)
      input_dcc_basic_acc_pair(0, Activate)
      input_dcc_basic_acc_pair(0, Deactivate)
      input_dcc_basic_acc_pair(0, Activate)
      input_dcc_basic_acc_pair(0, Activate)
      input_dcc_basic_acc_pair(0, Activate)
      input_dcc_basic_acc_pair(0, Activate)
      input_dcc_basic_acc_pair(0, Activate)
      input_dcc_basic_acc_pair(1, Deactivate)
      input_dcc_basic_acc_pair(0, Activate)
      input_dcc_basic_acc(510, Activate)
      input_dcc_basic_acc(510, Activate)
      input_dcc_basic_acc_pair(1019, Deactivate)
      input_dcc_basic_acc(510, Activate)
      input_dcc_extnd_acc(0, 42)
      input_dcc_extnd_acc(0, 42)
      input_dcc_extnd_acc(1, 33)
      input_dcc_extnd_acc(0, 42)
      input_dcc_extnd_acc(0, 42)
      input_dcc_basic_acc_pair(0, Deactivate)
      input_dcc_extnd_acc(0, 42)
      input_dcc_basic_acc_pair(1, Deactivate)
      input_dcc_basic_acc_pair(1, Deactivate)
      input_dcc_extnd_acc(0, 42)
      input_dcc_basic_acc_pair(1, Deactivate)
      log(DCC packets complete)
      wait;
    end process input_dcc_packets;
  --
end testbench;
