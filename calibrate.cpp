#include <iostream>
#include <pybind11/pybind11.h>
#include <pybind11/numpy.h>
#include <iostream>

namespace py = pybind11;

void correct_array(
        py::array_t<double> &outData, // dimensions: (y, x, cell id)
        py::array_t<bool> &badpixMask, // dimensions: (y, x, cell id)
        const py::array_t<double> &gainData, // dimensions: (y, x, cell id)
        const py::array_t<double> &gainLevelData, // dimensions: (gain level, y, x, cell id) 
        const py::array_t<double> &darkOffset, // dimensions: (gain level, y, x, cell id) 
        const py::array_t<double> &relativeGain,  // dimensions: (gain level, y, x, cell id) 
        const py::array_t<double> &badpixData  // dimensions: (gain level, y, x, cell id) 
        ){
    unsigned int Y = gainData.shape(0);
    unsigned int X = gainData.shape(1);
    unsigned int cellNum = gainData.shape(2);

    //py::array_t<double> result = py::array_t<double>({Y, X});
    auto outData_ptr = outData.mutable_unchecked<3>();
    auto badpixMask_ptr = badpixMask.mutable_unchecked<3>();
    auto gainData_ptr = gainData.unchecked<3>();
    auto gainLevelData_ptr = gainLevelData.unchecked<4>();
    auto darkOffset_ptr = darkOffset.unchecked<4>();
    auto relativeGain_ptr = relativeGain.unchecked<4>();
    auto badpixData_ptr = badpixData.unchecked<4>();

    std::cerr<<"X: " << X << " Y: " << Y << " cellNum:" << cellNum << std::endl;

    for(unsigned int cellId = 0; cellId < cellNum; cellId++) {
        std::cerr<<"in loop"<<std::endl;
        for (unsigned int y = 0; y < Y; ++y) {
            for (unsigned int x = 0; x < X; ++x) {
                // find the gain level `g` for pixel (x, y) at cell cellId
                unsigned int g=0;
                auto gd = gainData_ptr(y, x, cellId);
                if (gd > gainLevelData_ptr(2, y, x, cellId)) {
                    g = 2;
                } else {
                    if (gd > gainLevelData_ptr(1, y, x, cellId)) 
                        g = 1;
                }
                //outData_ptr(y, x, cellId) = 0;
                outData_ptr(y, x, cellId) = 
                    (outData_ptr(y, x, cellId) - darkOffset_ptr(g, y, x, cellId)) * relativeGain_ptr(g, y, x, cellId); 
                badpixMask_ptr(y, x, cellId) = badpixData_ptr(g, y, x, cellId) == 0;
            }
        }
    }
}


PYBIND11_MODULE(calibrate, m) {
  m.doc() = "Module docstring";
  m.def("correct_agipd", &correct_array, "Convert raw AGIPD data to calibrated.");
}
