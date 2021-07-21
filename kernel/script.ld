ENTRY(_start)

SECTIONS
{
  . = 0x8200;
  .text : { *(.text) }
  .data : { *(.data) }
  .bss : { *(.bss) }
}

