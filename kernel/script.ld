ENTRY(_start)

SECTIONS
{
  . = 0x8200;
  .init : { *(.init) }
  .text : { *(.text) }
  .data : { *(.data) }
  .rodata : { *(.rodata) }
  .bss : { *(.bss) }
}

