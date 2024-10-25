import openvino.runtime as ov

# Initialize the OpenVINO runtime core
core = ov.Core()

# Print all available devices
for device in core.available_devices:
    print(device)
