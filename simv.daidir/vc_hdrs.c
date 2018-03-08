#ifndef _GNU_SOURCE
#define _GNU_SOURCE
#endif
#include <stdio.h>
#include <dlfcn.h>
#include "svdpi.h"

#ifdef __cplusplus
extern "C" {
#endif

/* VCS error reporting routine */
extern void vcsMsgReport1(const char *, const char *, int, void *, void*, const char *);

#ifndef _VC_TYPES_
#define _VC_TYPES_
/* common definitions shared with DirectC.h */

typedef unsigned int U;
typedef unsigned char UB;
typedef unsigned char scalar;
typedef struct { U c; U d;} vec32;

#define scalar_0 0
#define scalar_1 1
#define scalar_z 2
#define scalar_x 3

extern long long int ConvUP2LLI(U* a);
extern void ConvLLI2UP(long long int a1, U* a2);
extern long long int GetLLIresult();
extern void StoreLLIresult(const unsigned int* data);
typedef struct VeriC_Descriptor *vc_handle;

#ifndef SV_3_COMPATIBILITY
#define SV_STRING const char*
#else
#define SV_STRING char*
#endif

#endif /* _VC_TYPES_ */

#ifndef __VCS_IMPORT_DPI_STUB_zbuff_init
#define __VCS_IMPORT_DPI_STUB_zbuff_init
__attribute__((weak)) int zbuff_init(/* INPUT */int A_1, /* INPUT */int A_2, /* INPUT */int A_3)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */int A_1, /* INPUT */int A_2, /* INPUT */int A_3) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(int A_1, int A_2, int A_3)) dlsym(RTLD_NEXT, "zbuff_init");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2, A_3);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "zbuff_init");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_zbuff_init */

#ifndef __VCS_IMPORT_DPI_STUB_zbuff_rop
#define __VCS_IMPORT_DPI_STUB_zbuff_rop
__attribute__((weak)) int zbuff_rop(/* INPUT */int A_1, /* INPUT */int A_2, /* INPUT */int A_3, /* INPUT */int A_4, /* INPUT */int A_5, /* INPUT */int A_6, /* INPUT */int A_7, /* INPUT */int A_8)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */int A_1, /* INPUT */int A_2, /* INPUT */int A_3, /* INPUT */int A_4, /* INPUT */int A_5, /* INPUT */int A_6, /* INPUT */int A_7, /* INPUT */int A_8) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(int A_1, int A_2, int A_3, int A_4, int A_5, int A_6, int A_7, int A_8)) dlsym(RTLD_NEXT, "zbuff_rop");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "zbuff_rop");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_zbuff_rop */

#ifndef __VCS_IMPORT_DPI_STUB_write_ppm
#define __VCS_IMPORT_DPI_STUB_write_ppm
__attribute__((weak)) int write_ppm()
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)() = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)()) dlsym(RTLD_NEXT, "write_ppm");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_();
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "write_ppm");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_write_ppm */

#ifndef __VCS_IMPORT_DPI_STUB_rastBBox_bbox_check
#define __VCS_IMPORT_DPI_STUB_rastBBox_bbox_check
__attribute__((weak)) int rastBBox_bbox_check(/* INPUT */int A_1, /* INPUT */int A_2, /* INPUT */int A_3, /* INPUT */int A_4, /* INPUT */int A_5, /* INPUT */int A_6, /* INPUT */int A_7, /* INPUT */int A_8, /* INPUT */int A_9, /* INPUT */int A_10, 
/* INPUT */int A_11, /* INPUT */int A_12, /* INPUT */int A_13, /* INPUT */int A_14, /* INPUT */int A_15, /* INPUT */int A_16, /* INPUT */int A_17, /* INPUT */int A_18, /* INPUT */int A_19, /* INPUT */int A_20
)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */int A_1, /* INPUT */int A_2, /* INPUT */int A_3, /* INPUT */int A_4, /* INPUT */int A_5, /* INPUT */int A_6, /* INPUT */int A_7, /* INPUT */int A_8, /* INPUT */int A_9, /* INPUT */int A_10, 
/* INPUT */int A_11, /* INPUT */int A_12, /* INPUT */int A_13, /* INPUT */int A_14, /* INPUT */int A_15, /* INPUT */int A_16, /* INPUT */int A_17, /* INPUT */int A_18, /* INPUT */int A_19, /* INPUT */int A_20
) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(int A_1, int A_2, int A_3, int A_4, int A_5, int A_6, int A_7, int A_8, int A_9, int A_10, int A_11, int A_12, int A_13, int A_14, int A_15, int A_16, int A_17, int A_18, int A_19, int A_20)) dlsym(RTLD_NEXT, "rastBBox_bbox_check");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15, A_16, A_17, A_18, A_19, A_20);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "rastBBox_bbox_check");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_rastBBox_bbox_check */

#ifndef __VCS_IMPORT_DPI_STUB_rastBBox_stest_check
#define __VCS_IMPORT_DPI_STUB_rastBBox_stest_check
__attribute__((weak)) int rastBBox_stest_check(/* INPUT */int A_1, /* INPUT */int A_2, /* INPUT */int A_3, /* INPUT */int A_4, /* INPUT */int A_5, /* INPUT */int A_6, /* INPUT */int A_7, /* INPUT */int A_8, /* INPUT */int A_9, /* INPUT */int A_10, 
/* INPUT */int A_11, /* INPUT */int A_12)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */int A_1, /* INPUT */int A_2, /* INPUT */int A_3, /* INPUT */int A_4, /* INPUT */int A_5, /* INPUT */int A_6, /* INPUT */int A_7, /* INPUT */int A_8, /* INPUT */int A_9, /* INPUT */int A_10, 
/* INPUT */int A_11, /* INPUT */int A_12) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(int A_1, int A_2, int A_3, int A_4, int A_5, int A_6, int A_7, int A_8, int A_9, int A_10, int A_11, int A_12)) dlsym(RTLD_NEXT, "rastBBox_stest_check");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "rastBBox_stest_check");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_rastBBox_stest_check */

#ifndef __VCS_IMPORT_DPI_STUB_rastBBox_check
#define __VCS_IMPORT_DPI_STUB_rastBBox_check
__attribute__((weak)) int rastBBox_check(/* INPUT */int A_1, /* INPUT */int A_2, /* INPUT */int A_3, /* INPUT */int A_4, /* INPUT */int A_5, /* INPUT */int A_6, /* INPUT */int A_7, /* INPUT */int A_8, /* INPUT */int A_9, /* INPUT */int A_10, 
/* INPUT */int A_11, /* INPUT */int A_12, /* INPUT */int A_13, /* INPUT */int A_14, /* INPUT */int A_15)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */int A_1, /* INPUT */int A_2, /* INPUT */int A_3, /* INPUT */int A_4, /* INPUT */int A_5, /* INPUT */int A_6, /* INPUT */int A_7, /* INPUT */int A_8, /* INPUT */int A_9, /* INPUT */int A_10, 
/* INPUT */int A_11, /* INPUT */int A_12, /* INPUT */int A_13, /* INPUT */int A_14, /* INPUT */int A_15) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(int A_1, int A_2, int A_3, int A_4, int A_5, int A_6, int A_7, int A_8, int A_9, int A_10, int A_11, int A_12, int A_13, int A_14, int A_15)) dlsym(RTLD_NEXT, "rastBBox_check");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2, A_3, A_4, A_5, A_6, A_7, A_8, A_9, A_10, A_11, A_12, A_13, A_14, A_15);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "rastBBox_check");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_rastBBox_check */

#ifndef __VCS_IMPORT_DPI_STUB_rastBBox_jhash_jit_fix_check
#define __VCS_IMPORT_DPI_STUB_rastBBox_jhash_jit_fix_check
__attribute__((weak)) int rastBBox_jhash_jit_fix_check(/* INPUT */int A_1, /* INPUT */int A_2, /* INPUT */int A_3, /* INPUT */int A_4, /* INPUT */int A_5, /* INPUT */int A_6, /* INPUT */int A_7)
{
    static int _vcs_dpi_stub_initialized_ = 0;
    static int (*_vcs_dpi_fp_)(/* INPUT */int A_1, /* INPUT */int A_2, /* INPUT */int A_3, /* INPUT */int A_4, /* INPUT */int A_5, /* INPUT */int A_6, /* INPUT */int A_7) = NULL;
    if (!_vcs_dpi_stub_initialized_) {
        _vcs_dpi_stub_initialized_ = 1;
        _vcs_dpi_fp_ = (int (*)(int A_1, int A_2, int A_3, int A_4, int A_5, int A_6, int A_7)) dlsym(RTLD_NEXT, "rastBBox_jhash_jit_fix_check");
    }
    if (_vcs_dpi_fp_) {
        return _vcs_dpi_fp_(A_1, A_2, A_3, A_4, A_5, A_6, A_7);
    } else {
        const char *fileName;
        int lineNumber;
        svGetCallerInfo(&fileName, &lineNumber);
        vcsMsgReport1("DPI-DIFNF", fileName, lineNumber, 0, 0, "rastBBox_jhash_jit_fix_check");
        return 0;
    }
}
#endif /* __VCS_IMPORT_DPI_STUB_rastBBox_jhash_jit_fix_check */


#ifdef __cplusplus
}
#endif

