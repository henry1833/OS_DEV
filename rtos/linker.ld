ENTRY(_start)

STACK_SIZE = 4096;

SECTIONS
{
	/* Starts at LOADER_ADDR. */
	__start = .;

	__text_start = .;
	.text :
	{
		KEEP(*(.text.boot))
		*(.text.unlikely .text.unlikely.*)
                *(.text.startup .text.startup.*)
                *(.text .text.*)
                *(.gnu.linkonce.t.*)
		*(.text)
	}
	. = ALIGN(0x10); /* align to page size */
	__text_end = .;
/*
	.fini :
	{
		KEEP (*(SORT_NONE(.fini)))
		_etext = .;
	}

	.rodata.align ALIGN(4):
	{
		_rodata = .;
	}

	.rodata.start :
	{
		_rodata_lma = LOADADDR(.rodata.start);
	}

	.rodata :
	{
		*(.rdata)
		*(.rodata .rodata.*)
		*(.gnu.linkonce.r.*)

		. = ALIGN(4);
		_erodata = .;
	}

	.data.align :
	{
		. = ALIGN(4);
		_data = .;
	}

	.data.start :
	{
		_data_lma = LOADADDR(.data.start);
	}
*/
	__data_start = .;
	.data :
	{
		. = ALIGN(8);
		*(.data .data.*)
		*(.gnu.linkonce.d.*)
		. = ALIGN(8);
		PROVIDE( __global_pointer$ = . + 0x800 );
		*(.sdata .sdata.*)
		*(.sdata2 .sdata2.*)
		*(.gnu.linkonce.s.*)
		. = ALIGN(8);
		*(.srodata.cst16)
		*(.srodata.cst8)
		*(.srodata.cst4)
		*(.srodata.cst2)
		*(.srodata .srodata.*)

		. = ALIGN(4);
		_edata = .;
	}
	. = ALIGN(0x10); /* align to page size */
	__data_end = .;
/*
	.tdata : {
		*(.tdata .tdata.*)
	}

	.tbss (NOLOAD) : {
		*(.tbss .tbss.* .gnu.linkonce.tb.*)
		*(.tcommon)
		PROVIDE( __tbss_end = . );
		PROVIDE( __tls_end = . );
	}
	PROVIDE( __tdata_source = LOADADDR(.tdata) );
	PROVIDE( __tdata_source_end = LOADADDR(.tdata) + SIZEOF(.tdata) );
	PROVIDE( __tdata_size = SIZEOF(.tdata) );
	PROVIDE( __tbss_offset = ADDR(.tbss) - ADDR(.tdata) );
	PROVIDE( __tbss_start = ADDR(.tbss) );
	PROVIDE( __tbss_size = SIZEOF(.tbss) );
	PROVIDE( __tls_size = __tls_end - ADDR(.tdata) );
	PROVIDE( __tls_align = MAX(ALIGNOF(.tdata), ALIGNOF(.tbss)) );
*/
	__bss_start = .;
	.bss :
	{
		*(.sbss*)
		*(.gnu.linkonce.sb.*)
		*(.bss .bss.*)
		*(.gnu.linkonce.b.*)
		*(COMMON)

		. = ALIGN(4);
		_ebss = .;
	}
	. = ALIGN(0x10); /* align to page size */
	__bss_end = .;
	__end = .;

	.stack :
	{
		. = ALIGN(16);
		. += STACK_SIZE;
		__stack_top = .;
	}
}
__bss_size = (__bss_end - __bss_start)>>3;
