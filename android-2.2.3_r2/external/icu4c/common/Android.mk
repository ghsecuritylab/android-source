# Copyright (C) 2008 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.


LOCAL_PATH:= $(call my-dir)

#
# Common definitions.
#

src_files := \
	cmemory.c          cstring.c          \
	cwchar.c           locmap.c           \
	punycode.c         putil.c            \
	uarrsort.c         ubidi.c            \
	ubidiln.c          ubidi_props.c      \
	ubidiwrt.c         ucase.c            \
	ucasemap.c         ucat.c             \
	uchar.c            ucln_cmn.c         \
	ucmndata.c                            \
	ucnv2022.c         ucnv_bld.c         \
	ucnvbocu.c         ucnv.c             \
	ucnv_cb.c          ucnv_cnv.c         \
	ucnvdisp.c         ucnv_err.c         \
	ucnv_ext.c         ucnvhz.c           \
	ucnv_io.c          ucnvisci.c         \
	ucnvlat1.c         ucnv_lmb.c         \
	ucnvmbcs.c         ucnvscsu.c         \
	ucnv_set.c         ucnv_u16.c         \
	ucnv_u32.c         ucnv_u7.c          \
	ucnv_u8.c          ucol_swp.c         \
	udata.c            udatamem.c         \
	udataswp.c         uenum.c            \
	uhash.c            uinit.c            \
	uinvchar.c         uloc.c             \
	umapfile.c         umath.c            \
	umutex.c           unames.c           \
	unorm_it.c                            \
	uprops.c           uresbund.c         \
	ures_cnv.c         uresdata.c         \
	usc_impl.c         uscript.c          \
	ushape.c           ustrcase.c         \
	ustr_cnv.c         ustrfmt.c          \
	ustring.c          ustrtrns.c         \
	ustr_wcs.c         utf_impl.c         \
	utrace.c           utrie.c            \
 	utypes.c           wintz.c            \
 	utrie2.c           utrie2_builder.c   \
 	propsvec.c         ulist.c            \
 	uloc_tag.c

src_files += \
        bmpset.cpp      unisetspan.cpp   \
	brkeng.cpp      brkiter.cpp      \
	caniter.cpp     chariter.cpp     \
	dictbe.cpp      locbased.cpp     \
	locid.cpp       locutil.cpp      \
	normlzr.cpp     parsepos.cpp     \
	propname.cpp    rbbi.cpp         \
	rbbidata.cpp    rbbinode.cpp     \
	rbbirb.cpp      rbbiscan.cpp     \
	rbbisetb.cpp    rbbistbl.cpp     \
	rbbitblb.cpp    resbund_cnv.cpp  \
	resbund.cpp     ruleiter.cpp     \
	schriter.cpp    serv.cpp         \
	servlk.cpp      servlkf.cpp      \
	servls.cpp      servnotf.cpp     \
	servrbf.cpp     servslkf.cpp     \
	triedict.cpp    ubrk.cpp         \
	uchriter.cpp    uhash_us.cpp     \
	uidna.cpp       uiter.cpp        \
	unifilt.cpp     unifunct.cpp     \
	uniset.cpp      uniset_props.cpp \
	unistr_case.cpp unistr_cnv.cpp   \
	unistr.cpp      unistr_props.cpp \
	unormcmp.cpp    unorm.cpp        \
	uobject.cpp     uset.cpp         \
	usetiter.cpp    uset_props.cpp   \
	usprep.cpp      ustack.cpp       \
	ustrenum.cpp    utext.cpp        \
	util.cpp        util_props.cpp   \
 	uvector.cpp     uvectr32.cpp     \
 	errorcode.cpp                    \
 	bytestream.cpp stringpiece.cpp   \
 	mutex.cpp       dtintrv.cpp      \
 	ucnvsel.cpp

c_includes := \
	$(LOCAL_PATH) \
	$(LOCAL_PATH)/../i18n


#
# Build for the target (device).
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(src_files)
LOCAL_C_INCLUDES := $(c_includes)

LOCAL_CFLAGS += -D_REENTRANT -DPIC -DU_COMMON_IMPLEMENTATION -fPIC
LOCAL_CFLAGS += -O3

LOCAL_SHARED_LIBRARIES += libicudata
LOCAL_LDLIBS += -lpthread -lm

LOCAL_MODULE := libicuuc

include $(BUILD_SHARED_LIBRARY)


#
# Build for the host.
#

ifeq ($(WITH_HOST_DALVIK),true)

    include $(CLEAR_VARS)

    LOCAL_SRC_FILES := $(src_files)
    LOCAL_C_INCLUDES := $(c_includes)

    LOCAL_CFLAGS += -D_REENTRANT -DU_COMMON_IMPLEMENTATION

    LOCAL_SHARED_LIBRARIES += libicudata
    LOCAL_LDLIBS += -lpthread -lm

    LOCAL_MODULE := libicuuc

    include $(BUILD_HOST_SHARED_LIBRARY)

endif
